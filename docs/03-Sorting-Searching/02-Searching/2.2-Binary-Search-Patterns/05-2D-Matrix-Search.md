# 05 - 2D Matrix Search

> **Binary Search on 2D Matrices**  
> **Interview Value:** ⭐⭐⭐⭐ - Common pattern  
> **Prerequisites:** [Binary Search Basics](../2.1-Binary-Search-Basics.md)

---

## Overview

There are two main types of 2D matrix search problems:

1. **Sorted Matrix** (LC 74): Rows are sorted, first element of each row > last element of previous row
2. **Row-Column Sorted Matrix** (LC 240): Each row AND column is sorted independently

Each requires a different approach!

---

## 🎯 Pattern Recognition

<details>
<summary><strong>Identifying Matrix Search Problems</strong></summary>

**Keywords:**
- "m * n matrix"
- "sorted matrix"
- "search for target"
- "rows/columns are sorted"

**Type 1 - Fully Sorted Matrix (LC 74):**
```
[1,  3,  5,  7 ]
[10, 11, 16, 20]
[23, 30, 34, 60]

→ Can treat as a single sorted array!
→ Use standard binary search with index conversion
```

**Type 2 - Row-Column Sorted (LC 240):**
```
[1,  4,  7, 11, 15]
[2,  5,  8, 12, 19]
[3,  6,  9, 16, 22]
[10, 13, 14, 17, 24]

→ Each row sorted, each column sorted
→ But rows DON'T continue from each other
→ Use "staircase" search from top-right or bottom-left
```

</details>

---

## ✅ When to Use

| Problem Type | Approach | Time Complexity |
|--------------|----------|-----------------|
| Fully sorted (LC 74) | Treat as 1D array |" O(log(m·n)) "|
| Row-col sorted (LC 240) | Staircase search |" O(m + n) "|

---

## ❌ When NOT to Use

| Situation | Use Instead | Why |
|-----------|-------------|-----|
| Unsorted matrix | Linear search or other | No sorted property |
| Need all occurrences | Full traversal | Binary search finds one |
| Matrix has duplicates | May need modification | Handle carefully |

---

## 🔗 Concept Map

<details>
<summary><strong>Prerequisites & Next Steps</strong></summary>

**Before this, you should know:**
- [Binary Search Basics](../2.1-Binary-Search-Basics.md)
- [2D Array Traversal](../../01-Arrays-Strings/01-Arrays/1.6-2D-Arrays.md)

**After mastering this:**
- [Sorted Matrix Kth Smallest](link) - Heap + Binary Search
- [Matrix Median](link) - Advanced

**Combines with:**
- Binary Search on Answer for matrix median

</details>

---

## 📐 How It Works

### Type 1: Fully Sorted Matrix (LC 74)

**Key Insight:** Treat the 2D matrix as a 1D sorted array!

```
Matrix (m=3, n=4):
[1,  3,  5,  7 ]    Index: 0  1  2  3
[10, 11, 16, 20]           4  5  6  7
[23, 30, 34, 60]           8  9  10 11

1D Index → 2D Coordinates:
index 5 → row = 5 // 4 = 1, col = 5 % 4 = 1 → matrix[1][1] = 11

Search for 16:
- Binary search on indices 0 to 11
- mid = 5 → matrix[1][1] = 11 < 16, go right
- mid = 8 → matrix[2][0] = 23 > 16, go left  
- mid = 6 → matrix[1][2] = 16 ✓ Found!
```

### Type 2: Row-Column Sorted Matrix (LC 240)

**Key Insight:** Start from top-right (or bottom-left). Each step eliminates a row OR column!

```
Matrix:
[1,  4,  7, 11, 15]
[2,  5,  8, 12, 19]   Start at (0, 4) = 15
[3,  6,  9, 16, 22]   
[10, 13, 14, 17, 24]

Search for 9:
Position (0, 4) = 15 > 9 → Move LEFT (eliminate column)
Position (0, 3) = 11 > 9 → Move LEFT
Position (0, 2) = 7 < 9 → Move DOWN (eliminate row)
Position (1, 2) = 8 < 9 → Move DOWN
Position (2, 2) = 9 = target ✓ Found!
```

**Why it works:**
- At top-right corner: largest in row, smallest in column
- If value > target: eliminate this column (everything below is larger)
- If value < target: eliminate this row (everything left is smaller)

---

## 💻 Code Implementation

### Type 1: Search a 2D Matrix (LC 74)

**Python:**
```python
def search_matrix(matrix: list[list[int]], target: int) -> bool:
    """
    Search in fully sorted 2D matrix.
    First element of each row > last element of previous row.
    
    Approach: Treat as 1D array, use standard binary search.
    Time: O(log(m·n)), Space: O(1)
    """
    if not matrix or not matrix[0]:
        return False
    
    m, n = len(matrix), len(matrix[0])
    left, right = 0, m * n - 1
    
    while left <= right:
        mid = left + (right - left) // 2
        
        # Convert 1D index to 2D coordinates
        row = mid // n
        col = mid % n
        value = matrix[row][col]
        
        if value == target:
            return True
        elif value < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return False


# Examples
matrix = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
]
print(search_matrix(matrix, 16))  # True
print(search_matrix(matrix, 13))  # False
```

**JavaScript:**
```javascript
function searchMatrix(matrix, target) {
    if (!matrix.length || !matrix[0].length) return false;
    
    const m = matrix.length;
    const n = matrix[0].length;
    let left = 0;
    let right = m * n - 1;
    
    while (left <= right) {
        const mid = left + Math.floor((right - left) / 2);
        const row = Math.floor(mid / n);
        const col = mid % n;
        const value = matrix[row][col];
        
        if (value === target) return true;
        else if (value < target) left = mid + 1;
        else right = mid - 1;
    }
    
    return false;
}
```

---

### Type 2: Search a 2D Matrix II (LC 240)

**Python:**
```python
def search_matrix_ii(matrix: list[list[int]], target: int) -> bool:
    """
    Search in row-column sorted 2D matrix.
    Each row and column is sorted independently.
    
    Approach: Start from top-right, eliminate row or column each step.
    Time: O(m + n), Space: O(1)
    """
    if not matrix or not matrix[0]:
        return False
    
    m, n = len(matrix), len(matrix[0])
    row, col = 0, n - 1  # Start at top-right
    
    while row < m and col >= 0:
        value = matrix[row][col]
        
        if value == target:
            return True
        elif value > target:
            col -= 1  # Eliminate this column
        else:
            row += 1  # Eliminate this row
    
    return False


# Examples
matrix = [
    [1, 4, 7, 11, 15],
    [2, 5, 8, 12, 19],
    [3, 6, 9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
]
print(search_matrix_ii(matrix, 9))   # True
print(search_matrix_ii(matrix, 20))  # False
```

**JavaScript:**
```javascript
function searchMatrixII(matrix, target) {
    if (!matrix.length || !matrix[0].length) return false;
    
    const m = matrix.length;
    const n = matrix[0].length;
    let row = 0;
    let col = n - 1;
    
    while (row < m && col >= 0) {
        const value = matrix[row][col];
        
        if (value === target) return true;
        else if (value > target) col--;
        else row++;
    }
    
    return false;
}
```

---

### Alternative: Bottom-Left Start

```python
def search_matrix_bottom_left(matrix: list[list[int]], target: int) -> bool:
    """Same logic, but start from bottom-left."""
    if not matrix or not matrix[0]:
        return False
    
    m, n = len(matrix), len(matrix[0])
    row, col = m - 1, 0  # Start at bottom-left
    
    while row >= 0 and col < n:
        value = matrix[row][col]
        
        if value == target:
            return True
        elif value > target:
            row -= 1  # Eliminate this row
        else:
            col += 1  # Eliminate this column
    
    return False
```

---

## ⚡ Complexity Analysis

| Problem | Time | Space | Why |
|---------|------|-------|-----|
| Fully Sorted (LC 74) |" O(log(m·n)) "|" O(1) "| Single binary search |
| Row-Col Sorted (LC 240) |" O(m + n) "|" O(1) "| At most m + n moves |

**Why O(m + n) for LC 240?**
- Each step either increments row OR decrements column
- Row can go from 0 to m-1 (at most m moves)
- Column can go from n-1 to 0 (at most n moves)
- Total: at most m + n moves

---

## 🔄 Variations

| Variation | Description | Approach |
|-----------|-------------|----------|
| Fully sorted matrix | First of row > last of prev |" Binary search O(log mn) "|
| Row-col sorted | Each row & col sorted |" Staircase O(m+n) "|
| Count elements ≤ x | In row-col sorted |" Staircase O(m+n) "|
| Kth smallest | Find kth smallest | Binary search + count |
| Matrix median | Find median | Binary search on answer |

---

## ⚠️ Common Mistakes

### 1. Wrong Matrix Type Identification

❌ **Wrong:**
```python
# Using binary search on row-column sorted matrix
# This doesn't work! Rows don't continue each other
```

✅ **Correct:**
```python
# Check if matrix[i][n-1] < matrix[i+1][0] for fully sorted
# Otherwise use staircase search
```

### 2. Index Conversion Error

❌ **Wrong:**
```python
row = mid // m  # Wrong! Should divide by n (columns)
col = mid % m
```

✅ **Correct:**
```python
row = mid // n  # Divide by number of columns
col = mid % n
```

### 3. Wrong Starting Point for LC 240

❌ **Wrong:**
```python
row, col = 0, 0  # Top-left doesn't work!
# Both directions have larger elements
```

✅ **Correct:**
```python
row, col = 0, n - 1  # Top-right
# OR
row, col = m - 1, 0  # Bottom-left
```

### 4. Boundary Conditions

❌ **Wrong:**
```python
while row <= m and col >= 0:  # IndexError!
```

✅ **Correct:**
```python
while row < m and col >= 0:  # Proper bounds
```

---

## 📝 Practice Problems

### Medium

| Problem | Type | LeetCode |
|---------|------|----------|
| Search a 2D Matrix | Fully sorted | [LC 74](https://leetcode.com/problems/search-a-2d-matrix/) |
| Search a 2D Matrix II | Row-col sorted | [LC 240](https://leetcode.com/problems/search-a-2d-matrix-ii/) |

### Hard

| Problem | Focus | LeetCode |
|---------|-------|----------|
| Kth Smallest Element in Sorted Matrix | Binary + count | [LC 378](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/) |

<details>
<summary><strong>🧠 Spaced Repetition Schedule</strong></summary>

**Week 1:**
- Day 1: LC 74 Search Matrix (binary search approach)
- Day 3: LC 240 Search Matrix II (staircase approach)
- Day 5: Redo both without looking

**Week 2:**
- Day 8: LC 378 Kth Smallest (combines both concepts)
- Day 14: Review and compare approaches

**Key question to ask yourself:**
"Does each row continue from the previous? If yes → binary search. If no → staircase."

</details>

---

## 🎤 Interview Context

<details>
<summary><strong>How to Communicate in Interviews</strong></summary>

**Clarifying question:**
> "Is the matrix sorted such that each row continues from the previous, or are rows and columns sorted independently? This determines my approach."

**For LC 74:**
> "Since the matrix is essentially one sorted array, I'll use binary search with index conversion. Index i maps to row i/n and column i%n."

**For LC 240:**
> "I'll start from the top-right corner. At each position, I can eliminate either a row or column. If current > target, I go left. If current < target, I go down."

**Why top-right/bottom-left works:**
> "These corners have the property that one direction has all larger elements and one has all smaller. This lets me make a decision at each step."

**Company Focus:**

| Company | Frequency |
|---------|-----------|
| Amazon | ⭐⭐⭐⭐ Common |
| Microsoft | ⭐⭐⭐⭐ Common |
| Google | ⭐⭐⭐ Moderate |
| Meta | ⭐⭐⭐ Moderate |

</details>

---

## ⏱️ Time Estimates

| Activity | Time | Notes |
|----------|------|-------|
| Understand both types | 20-30 min | Draw the matrices |
| LC 74 Fully Sorted | 15-20 min | Index math |
| LC 240 Row-Col Sorted | 20-25 min | Staircase intuition |
| LC 378 Kth Smallest | 35-45 min | Binary search + count |
| Master pattern | 1 week | Practice variations |

---

## 💡 Key Insight

> **The two matrix types require different approaches:**
>
> **LC 74 (Fully Sorted):** Treat as 1D array → `index = row * cols + col`
>
> **LC 240 (Row-Col Sorted):** Start from top-right or bottom-left:
> - If current > target: eliminate column (go left)
> - If current < target: eliminate row (go down)
>
> Always clarify which type you're dealing with!

---

## 🔗 Related

- [Binary Search Basics](../2.1-Binary-Search-Basics.md) - Foundation
- [Boundary Search](./02-Boundary-Search.md) - Finding positions
- [2D Array Techniques](../../01-Arrays-Strings/01-Arrays/1.6-2D-Arrays.md) - Matrix basics
