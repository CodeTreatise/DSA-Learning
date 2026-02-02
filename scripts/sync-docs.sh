#!/bin/bash

# DSA Mastery - Documentation Sync Script (v2.0)
# Syncs ALL content from source to website/docs for Docusaurus
# All 17 units (00-16) are fully expanded

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$(dirname "$WEBSITE_DIR")"
DOCS_DIR="$WEBSITE_DIR/docs"

echo "🔄 DSA Mastery - Documentation Sync (v2.0)"
echo "==========================================="
echo "Source: $SOURCE_DIR"
echo "Target: $DOCS_DIR"
echo ""

# Step 1: Clean existing docs (except index.md)
echo "📁 Step 1: Cleaning existing docs..."
if [ -d "$DOCS_DIR" ]; then
    find "$DOCS_DIR" -mindepth 1 -maxdepth 1 ! -name 'index.md' -exec rm -rf {} +
fi
mkdir -p "$DOCS_DIR"

# Step 2: Copy ALL expanded topic folders (XX-TopicName/)
echo "📂 Step 2: Copying all expanded topic folders..."
for dir in "$SOURCE_DIR"/[0-9][0-9]-*/; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        cp -r "$dir" "$DOCS_DIR/"
        echo "  ✓ $dirname/"
    fi
done

# Step 3: Remove execution checklists from website
echo "🧹 Step 3: Cleaning up non-content files..."
find "$DOCS_DIR" -name "EXECUTION-CHECKLIST-*.md" -delete 2>/dev/null || true
echo "  ✓ Removed execution checklists"

# Step 4: Fix links for Docusaurus compatibility
echo "🔧 Step 4: Fixing links for Docusaurus..."

find "$DOCS_DIR" -name "*.md" -type f -print0 | while IFS= read -r -d '' file; do
    # Fix folder links to point to index files
    sed -i \
        -e 's|(1.4-Common-Techniques/)|(1.4-Common-Techniques/00-Technique-Overview.md)|g' \
        -e 's|(./1.4-Common-Techniques/)|(./1.4-Common-Techniques/00-Technique-Overview.md)|g' \
        -e 's|(./2.3-Core-Patterns/)|(./2.3-Core-Patterns/01-Subsets-Pattern.md)|g' \
        -e 's|(../01-Recursion/1.4-Basic-Problems/)|(../01-Recursion/1.4-Basic-Problems/01-Factorial-Fibonacci.md)|g' \
        -e 's|06-Trees/03-Tree-Traversals/3.1-DFS-Traversals|06-Trees/01-Tree-Fundamentals/1.3-Tree-Traversals.md|g' \
        "$file" 2>/dev/null || true
    
    # Fix cross-topic links for Docusaurus folder structure
    sed -i \
        -e 's|\./00-Prerequisites\.md|../00-Prerequisites/00-Prerequisites.md|g' \
        -e 's|\./01-Arrays-Strings\.md|../01-Arrays-Strings/01-Arrays-Strings.md|g' \
        -e 's|\./02-Recursion-Backtracking\.md|../02-Recursion-Backtracking/02-Recursion-Backtracking.md|g' \
        "$file" 2>/dev/null || true
    
    # Fix Mermaid syntax issues
    sed -i 's/×/*/g' "$file" 2>/dev/null || true
    perl -i -pe 's/\[([^\[\]"]*O\([^)]+\)[^\[\]"]*)\]/["$1"]/g' "$file" 2>/dev/null || true
done

# Step 5: Add frontmatter to topic index files with proper labels
echo "📄 Step 5: Adding frontmatter to topic indices..."

# Define proper sidebar labels for each topic
declare -A labels=(
    ["00-Prerequisites"]="Prerequisites"
    ["01-Arrays-Strings"]="Arrays & Strings"
    ["02-Recursion-Backtracking"]="Recursion & Backtracking"
    ["03-Sorting-Searching"]="Sorting & Searching"
    ["04-Linked-Lists"]="Linked Lists"
    ["05-Stacks-Queues"]="Stacks & Queues"
    ["06-Trees"]="Trees"
    ["07-Binary-Search-Trees"]="Binary Search Trees"
    ["08-Heaps-Priority-Queues"]="Heaps & Priority Queues"
    ["09-Hashing"]="Hashing"
    ["10-Graphs"]="Graphs"
    ["11-Dynamic-Programming"]="Dynamic Programming"
    ["12-Greedy-Algorithms"]="Greedy Algorithms"
    ["13-Tries"]="Tries"
    ["14-Advanced-Data-Structures"]="Advanced Data Structures"
    ["15-Bit-Manipulation"]="Bit Manipulation"
    ["16-Math-Number-Theory"]="Math & Number Theory"
)

for dir in "$DOCS_DIR"/[0-9][0-9]-*/; do
    dirname=$(basename "$dir")
    indexfile="$dir/$dirname.md"
    if [ -f "$indexfile" ]; then
        if ! head -1 "$indexfile" | grep -q "^---"; then
            slug="/$dirname"
            label="${labels[$dirname]:-$dirname}"
            tmpfile=$(mktemp)
            cat > "$tmpfile" << EOF
---
sidebar_position: 1
sidebar_label: "$label"
slug: $slug
---

EOF
            cat "$indexfile" >> "$tmpfile"
            mv "$tmpfile" "$indexfile"
        fi
    fi
done
echo "  ✓ Added frontmatter"

echo ""
echo "✅ Sync complete!"
echo ""
echo "📊 Statistics:"
folders=$(find "$DOCS_DIR" -maxdepth 1 -type d ! -name 'docs' | wc -l)
files=$(find "$DOCS_DIR" -name "*.md" -type f | wc -l)
echo "  Topics: $folders directories"
echo "  Total MD files: $files"
echo ""
echo "🚀 Run 'npm run start' in website/ to preview"
