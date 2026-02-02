#!/bin/bash

DOCS_DIR="./docs"

echo "🔧 Fixing broken links in docs..."

# Fix folder links that don't have a target file - convert to index files
find "$DOCS_DIR" -name "*.md" -type f | while read -r file; do
    # Fix ./1.4-Common-Techniques -> ./1.4-Common-Techniques/00-Technique-Overview.md
    sed -i 's|\./1\.4-Common-Techniques)|./1.4-Common-Techniques/00-Technique-Overview.md)|g' "$file"
    sed -i 's|\./1\.4-Common-Techniques\]|./1.4-Common-Techniques/00-Technique-Overview.md]|g' "$file"
    
    # Fix ./2.3-Core-Patterns -> ./2.3-Core-Patterns/01-Subsets-Pattern.md
    sed -i 's|\./2\.3-Core-Patterns)|./2.3-Core-Patterns/01-Subsets-Pattern.md)|g' "$file"
    sed -i 's|\./2\.3-Core-Patterns\]|./2.3-Core-Patterns/01-Subsets-Pattern.md]|g' "$file"
    
    # Fix 1.4-Basic-Problems -> 1.4-Basic-Problems/01-Factorial-Fibonacci.md
    sed -i 's|1\.4-Basic-Problems)|1.4-Basic-Problems/01-Factorial-Fibonacci.md)|g' "$file"
    sed -i 's|1\.4-Basic-Problems\]|1.4-Basic-Problems/01-Factorial-Fibonacci.md]|g' "$file"
    
    # Remove/fix broken links to non-existent files 
    # 3.1-DFS-Traversals (doesn't exist - remove links)
    sed -i 's|\[DFS Traversals\](./../../06-Trees/03-Tree-Traversals/3.1-DFS-Traversals)||g' "$file"
    sed -i 's|(./../../06-Trees/03-Tree-Traversals/3.1-DFS-Traversals)||g' "$file"
    sed -i 's|./../../06-Trees/03-Tree-Traversals/3.1-DFS-Traversals|#|g' "$file"
    
    # Fix practice file links that don't exist - convert to parent
    sed -i 's|\./4\.4-DFS-Practice|./4.3-DFS-Classic-Problems.md|g' "$file"
    sed -i 's|\./8\.5-SP-Practice|./8.4-Path-Problems.md|g' "$file"
    sed -i 's|\./6\.2-01-Knapsack-Practice|./6.1-01-Knapsack-DP.md|g' "$file"
    sed -i 's|\./6\.4-Unbounded-Practice|./6.3-Unbounded-Knapsack.md|g' "$file"
done

echo "✅ Fixed broken links"
