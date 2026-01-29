#!/bin/bash

# DSA Mastery - Documentation Sync Script
# Syncs content from source to website/docs and fixes Docusaurus compatibility issues

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$(dirname "$WEBSITE_DIR")"
DOCS_DIR="$WEBSITE_DIR/docs"

echo "🔄 DSA Mastery - Documentation Sync"
echo "===================================="
echo "Source: $SOURCE_DIR"
echo "Target: $DOCS_DIR"
echo ""

# Step 1: Clean existing docs (except index.md)
echo "📁 Step 1: Cleaning existing docs..."
if [ -d "$DOCS_DIR" ]; then
    # Remove all except index.md
    find "$DOCS_DIR" -mindepth 1 -maxdepth 1 ! -name 'index.md' -exec rm -rf {} +
fi
mkdir -p "$DOCS_DIR"

# Step 2: Copy expanded topic folders (XX-TopicName/)
# Note: We only copy folders, not standalone topic files (they exist inside folders)
echo "📂 Step 2: Copying expanded topic folders..."
for dir in "$SOURCE_DIR"/[0-9][0-9]-*/; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        cp -r "$dir" "$DOCS_DIR/"
        echo "  ✓ $dirname/"
    fi
done

# Step 3: Fix links for Docusaurus compatibility
echo "🔧 Step 3: Fixing links for Docusaurus..."

fix_links() {
    local file="$1"
    
    sed -i \
        -e 's|\./1\.4-Basic-Problems/)|./1.4-Basic-Problems/01-Factorial-Fibonacci.md)|g' \
        -e 's|\./1\.4-Basic-Problems/\]|./1.4-Basic-Problems/01-Factorial-Fibonacci.md]|g' \
        -e 's|\.\./01-Recursion/1\.4-Basic-Problems/)|../01-Recursion/1.4-Basic-Problems/01-Factorial-Fibonacci.md)|g' \
        -e 's|\.\./01-Recursion/1\.4-Basic-Problems/\]|../01-Recursion/1.4-Basic-Problems/01-Factorial-Fibonacci.md]|g' \
        -e 's|\./2\.3-Core-Patterns/)|./2.3-Core-Patterns/01-Subsets-Pattern.md)|g' \
        -e 's|\./2\.3-Core-Patterns/\]|./2.3-Core-Patterns/01-Subsets-Pattern.md]|g' \
        -e 's|3\.1-DFS-Traversals/)|3.1-DFS-Traversals/01-Inorder-Traversal.md)|g' \
        -e 's|3\.1-DFS-Traversals/\]|3.1-DFS-Traversals/01-Inorder-Traversal.md]|g' \
        -e 's|3\.2-BFS-Traversals/)|3.2-BFS-Traversals/00-BFS-Concept.md)|g' \
        -e 's|3\.2-BFS-Traversals/\]|3.2-BFS-Traversals/00-BFS-Concept.md]|g' \
        -e 's|1\.4-Common-Techniques/)|1.4-Common-Techniques/00-Technique-Overview.md)|g' \
        -e 's|1\.4-Common-Techniques/\]|1.4-Common-Techniques/00-Technique-Overview.md]|g' \
        "$file"
}

# Remove links to unexpanded topics (09-17, 00) - replace with plain text
remove_broken_topic_links() {
    local file="$1"
    
    sed -i \
        -e 's|\[Prerequisites\](\.\./\.\./00-Prerequisites\.md)|Prerequisites|g' \
        -e 's|\[Prerequisites\](\./00-Prerequisites\.md)|Prerequisites|g' \
        -e 's|\[Hashing\](\.\./\.\./09-Hashing\.md)|Hashing|g' \
        -e 's|\[Hashing\](\./09-Hashing\.md)|Hashing|g' \
        -e 's|\[Graphs\](\.\./\.\./10-Graphs\.md)|Graphs|g' \
        -e 's|\[Graphs\](\./10-Graphs\.md)|Graphs|g' \
        -e 's|\[Dynamic Programming\](\.\./\.\./11-Dynamic-Programming\.md)|Dynamic Programming|g' \
        -e 's|\[Dynamic Programming\](\./11-Dynamic-Programming\.md)|Dynamic Programming|g' \
        -e 's|\[Greedy\](\.\./\.\./12-Greedy-Algorithms\.md)|Greedy|g' \
        -e 's|\[Greedy\](\./12-Greedy-Algorithms\.md)|Greedy|g' \
        -e 's|\[Tries\](\.\./\.\./13-Tries\.md)|Tries|g' \
        -e 's|\[Tries\](\./13-Tries\.md)|Tries|g' \
        -e 's|\[Advanced Data Structures\](\.\./\.\./14-Advanced-Data-Structures\.md)|Advanced Data Structures|g' \
        -e 's|\[Advanced Data Structures\](\./14-Advanced-Data-Structures\.md)|Advanced Data Structures|g' \
        -e 's|\[Bit Manipulation\](\.\./\.\./15-Bit-Manipulation\.md)|Bit Manipulation|g' \
        -e 's|\[Bit Manipulation\](\./15-Bit-Manipulation\.md)|Bit Manipulation|g' \
        -e 's|\[Math\](\.\./\.\./16-Math-Number-Theory\.md)|Math|g' \
        -e 's|\[Math\](\./16-Math-Number-Theory\.md)|Math|g' \
        "$file"
    
    # Also fix various other patterns
    sed -i \
        -e 's|\](\.\.\/\.\.\/09-Hashing\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/10-Graphs\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/11-Dynamic-Programming\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/13-Tries\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/14-Advanced-Data-Structures\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/15-Bit-Manipulation\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/00-Prerequisites\.md)|](#)|g' \
        -e 's|\](\.\.\/\.\.\/\.\.\/15-Bit-Manipulation\.md)|](#)|g' \
        "$file"
}

# Fix cross-topic links (within expanded topics)
fix_cross_topic_links() {
    local file="$1"
    
    sed -i \
        -e 's|\./02-Recursion-Backtracking\.md|../02-Recursion-Backtracking/02-Recursion-Backtracking.md|g' \
        -e 's|\./03-Sorting-Searching\.md|../03-Sorting-Searching/03-Sorting-Searching.md|g' \
        -e 's|\./04-Linked-Lists\.md|../04-Linked-Lists/04-Linked-Lists.md|g' \
        -e 's|\./05-Stacks-Queues\.md|../05-Stacks-Queues/05-Stacks-Queues.md|g' \
        -e 's|\./06-Trees\.md|../06-Trees/06-Trees.md|g' \
        -e 's|\./07-Binary-Search-Trees\.md|../07-Binary-Search-Trees/07-Binary-Search-Trees.md|g' \
        -e 's|\./08-Heaps-Priority-Queues\.md|../08-Heaps-Priority-Queues/08-Heaps-Priority-Queues.md|g' \
        -e 's|\.\./06-Trees\.md|../06-Trees/06-Trees.md|g' \
        -e 's|\.\./08-Heaps-Priority-Queues\.md|../08-Heaps-Priority-Queues/08-Heaps-Priority-Queues.md|g' \
        -e 's|\.\./\.\./06-Trees\.md|../../06-Trees/06-Trees.md|g' \
        -e 's|\.\./\.\./08-Heaps-Priority-Queues\.md|../../08-Heaps-Priority-Queues/08-Heaps-Priority-Queues.md|g' \
        -e 's|\.\./\.\./03-Sorting-Searching\.md|../../03-Sorting-Searching/03-Sorting-Searching.md|g' \
        -e 's|\.\./\.\./04-Linked-Lists\.md|../../04-Linked-Lists/04-Linked-Lists.md|g' \
        -e 's|\.\./\.\./05-Stacks-Queues\.md|../../05-Stacks-Queues/05-Stacks-Queues.md|g' \
        "$file"
}

# Fix broken internal file links
fix_internal_links() {
    local file="$1"
    
    sed -i \
        -e 's|\.\./02-Binary-Tree-Basics/2\.1-Binary-Trees\.md|../02-Binary-Tree-Basics/2.2-Binary-Tree-Representation.md|g' \
        -e 's|\.\./\.\./related/subtree\.md|#|g' \
        -e 's|\.\./\.\./10-Graphs/path-problems\.md|#|g' \
        "$file"
}

# Fix Mermaid diagram syntax for Docusaurus
fix_mermaid_syntax() {
    local file="$1"
    
    # Replace × with * (multiplication symbol)
    sed -i 's/×/*/g' "$file"
    
    # Quote O() notation in Mermaid node labels: [text O(...)] -> ["text O(...)"]
    # Using Perl for better regex support
    perl -i -pe 's/\[([^\[\]"]*O\([^)]+\)[^\[\]"]*)\]/["$1"]/g' "$file" 2>/dev/null || true
    
    # Quote O() in Mermaid edge labels: |O(...) xxx| -> |"O(...) xxx"|
    perl -i -pe 's/\|([^|"]*O\([^)]+\)[^|"]*)\|/|"$1"|/g' "$file" 2>/dev/null || true
}

# Add frontmatter to topic index files
add_frontmatter() {
    local file="$1"
    local dirname=$(dirname "$file")
    local basename=$(basename "$file" .md)
    
    # Only add to topic index files (XX-TopicName/XX-TopicName.md)
    if [[ "$basename" =~ ^[0-9]{2}- ]] && [[ "$(basename "$dirname")" == "$basename" ]]; then
        # Check if frontmatter already exists
        if ! head -1 "$file" | grep -q "^---"; then
            local slug="/$basename"
            
            # Generate proper sidebar label from folder name
            local label=$(echo "$basename" | sed 's/^[0-9]*-//' | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
            
            local tmpfile=$(mktemp)
            cat > "$tmpfile" << EOF
---
sidebar_position: 1
sidebar_label: $label
slug: $slug
---

EOF
            cat "$file" >> "$tmpfile"
            mv "$tmpfile" "$file"
        fi
    fi
}

# Process all markdown files
find "$DOCS_DIR" -name "*.md" -type f | while read -r file; do
    fix_links "$file"
    remove_broken_topic_links "$file"
    fix_cross_topic_links "$file"
    fix_internal_links "$file"
    fix_mermaid_syntax "$file"
    add_frontmatter "$file"
done
echo "  ✓ Fixed all links in markdown files"

# Step 4: Summary
echo ""
echo "✅ Sync complete!"
echo ""
echo "📊 Statistics:"
echo "  Folders: $(find "$DOCS_DIR" -maxdepth 1 -type d | wc -l) directories"
echo "  Total MD files: $(find "$DOCS_DIR" -name "*.md" -type f | wc -l)"
echo ""
echo "🚀 Run 'npm run start' in website/ to preview"
