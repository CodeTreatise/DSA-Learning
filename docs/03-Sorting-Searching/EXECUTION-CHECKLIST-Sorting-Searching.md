# EXECUTION CHECKLIST: Unit 3 - Sorting & Searching




































































































































































































































































































































































































































































































































































- [Heaps & Priority Queues](.../08-Heaps-Priority-Queues/08-Heaps-Priority-Queues.md) - Data structure- [Merge Sort](./1.3-Merge-Sort.md) - Another O(n log n)- [Quick Sort](./1.4-Quick-Sort.md) - Compare approaches- [Sorting Basics](./1.1-Sorting-Basics.md) - Algorithm overview## 🔗 Related---> In practice, the **heap data structure** (priority queue) is far more important than Heap Sort for interviews!>> - Heapify each node going up> - Start from last non-leaf: `n // 2 - 1`> **Build heap in O(n):**>> - Right child: `2 * i + 2`> - Left child: `2 * i + 1`> - Parent: `(i - 1) // 2`> **Index formulas (0-indexed):**>> The only comparison sort with both guarantees!>> **Heap Sort = Guaranteed O(n log n) + O(1) space**## 💡 Key Insight---| LC 23 Merge K Lists | 30-40 min | Heap application || LC 215 (with heapq) | 10-15 min | Python shortcut || Implement full heap sort | 20-25 min | Build heap + extract || Implement heapify | 15-20 min | Core operation || Understand heap property | 15-20 min | Draw tree representation ||----------|------|-------|| Activity | Time | Notes |## ⏱️ Time Estimates---</details>| Amazon | Top K problems very common || Google | May ask to implement heap sort || All | Heap data structure (priority queue) ||---------|-------|| Company | Focus |**Company relevance:**- Median in stream (LC 295)- Merge K sorted lists (LC 23)- Top K problems (LC 215, LC 347, LC 373)**More common interview topic - Heap data structure:**> "If I need guaranteed O(n log n) with O(1) extra space and stability doesn't matter, Heap Sort is the choice."**When to mention Heap Sort:**> "In practice, Quick Sort is faster due to better cache locality. Heap Sort is used as a fallback in IntroSort when Quick Sort's recursion depth gets too deep."**Why it's rarely used:**> "Heap Sort uses a max-heap to sort in-place. It guarantees O(n log n) time with O(1) space, which is unique among comparison sorts."**When asked about Heap Sort:**<summary><strong>How to Communicate in Interviews</strong></summary><details>## 🎤 Interview Context---</details>- Know when each is appropriate**Day 14:** Compare Heap Sort with Quick Sort- Use heap data structure, not heap sort**Day 7:** LC 215 Kth Largest Element- Know parent/child index formulas**Day 3:** Implement heap_sort from scratch- Draw heap as tree and array**Day 1:** Understand heap property and heapify operation<summary><strong>🧠 Spaced Repetition Schedule</strong></summary><details>| Find Median from Data Stream | Two heaps | [LC 295](https://leetcode.com/problems/find-median-from-data-stream/) || Merge K Sorted Lists | Heap for K-way merge | [LC 23](https://leetcode.com/problems/merge-k-sorted-lists/) ||---------|-------|----------|| Problem | Focus | LeetCode |### Hard| Top K Frequent Elements | Heap + Hash Map | [LC 347](https://leetcode.com/problems/top-k-frequent-elements/) || Kth Largest Element | Heap usage | [LC 215](https://leetcode.com/problems/kth-largest-element-in-an-array/) || Sort an Array | Implement Heap Sort | [LC 912](https://leetcode.com/problems/sort-an-array/) ||---------|-------|----------|| Problem | Focus | LeetCode |### Medium## 📝 Practice Problems---- Remaining elements are larger- Extract min and put at endFor descending sort, use **min-heap**:- Remaining elements are smaller- Extract max and put at endFor ascending sort, use **max-heap**:### 4. Confusing Min-Heap vs Max-Heap```    heapify(i, 0)  # Reduced heap size    arr[0], arr[i] = arr[i], arr[0]for i in range(n - 1, 0, -1):```python✅ **Correct:**```    heapify(n, 0)  # Still using full size!    arr[0], arr[i] = arr[i], arr[0]for i in range(n - 1, 0, -1):```python❌ **Wrong:**### 3. Not Reducing Heap Size During Extraction```right = 2 * root + 2left = 2 * root + 1  # 0-indexed```python✅ **Correct:**```right = 2 * root + 1left = 2 * root  # Wrong for 0-indexed```python❌ **Wrong:**### 2. Wrong Child Index Calculation```    heapify(n, i)for i in range(n // 2 - 1, -1, -1):  # Start from last non-leaf```python✅ **Correct:**```    heapify(n, i)for i in range(n - 1, -1, -1):  # Includes leaves```python❌ **Wrong:**### 1. Wrong Starting Index for Build Heap## ⚠️ Common Mistakes---- IntroSort uses Quick Sort + Heap Sort as fallback- More swaps than Quick Sort on average- Poor cache performance (accessing distant array elements)**Why Heap Sort is rarely used:**| **In Practice** | Rarely used | Most common | For stability || **Cache** | Poor | Good | Medium || **Stable** | ❌ No | ❌ No | ✅ Yes || **Space** | O(1) | O(log n) | O(n) || **Time (Worst)** | O(n log n) | O(n²) | O(n log n) || **Time (Best)** | O(n log n) | O(n log n) | O(n log n) ||--------|-----------|------------|------------|| Aspect | Heap Sort | Quick Sort | Merge Sort |## 🔄 Comparison with Other Sorts---- Only O(1) variables for swapping- No auxiliary arrays needed- Heap is built in-place using array representation**Why O(1) space?**```Total: O(n) + O(n log n) = O(n log n)  - n extractions * O(log n) heapify eachExtract n elements: O(n log n)  - Sum of heights = O(n)  - Heapify is O(height) per node  - Most nodes are leaves (n/2)Build heap: O(n) - tighter bound, not O(n log n)```**Why O(n log n)?**| Worst | O(n log n) | O(1) | Always heapify || Average | O(n log n) | O(1) | Always heapify || Best | O(n log n) | O(1) | Always heapify ||------|------|-------|-----|| Case | Time | Space | Why |## ⚡ Complexity Analysis---```    return [-heapq.heappop(arr) for _ in range(len(arr))]    heapq.heapify(arr)    arr = [-x for x in arr]    """Python heapq is min-heap, so negate values."""def heap_sort_descending(arr: list[int]) -> list[int]:# For descending order (max-heap simulation)    return [heapq.heappop(arr) for _ in range(len(arr))]    heapq.heapify(arr)  # O(n)    """    Not in-place but simple for interviews.    Using Python's heapq module.    """def heap_sort_builtin(arr: list[int]) -> list[int]:import heapq```python### Using Python's heapq (Interview Shortcut)---```    return result            result.append(heapq.heappop(arr))    while arr:    result = []        heapq.heapify(arr)  # Build min-heap in-place        import heapq    """    Note: This is NOT in-place (uses extra array).    Using min-heap approach (for educational purposes).    """def heap_sort_min_heap(arr: list[int]) -> list[int]:```python### Min-Heap for Ascending Order (Alternative)---```        root = largest        arr[root], arr[largest] = arr[largest], arr[root]                    break        if largest == root:                    largest = right        if right < size and arr[right] > arr[largest]:                    largest = left        if left < size and arr[left] > arr[largest]:                right = 2 * root + 2        left = 2 * root + 1        largest = root    while True:    """Iterative version to avoid stack overflow."""def heapify_iterative(arr: list[int], size: int, root: int) -> None:```python### Iterative Heapify (No Recursion)---```console.log(heapSort([12, 11, 13, 5, 6, 7]));}    return arr;        }        heapify(i, 0);        [arr[0], arr[i]] = [arr[i], arr[0]];    for (let i = n - 1; i > 0; i--) {    // Extract elements        }        heapify(n, i);    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {    // Build max-heap        }        }            heapify(size, largest);            [arr[root], arr[largest]] = [arr[largest], arr[root]];        if (largest !== root) {                }            largest = right;        if (right < size && arr[right] > arr[largest]) {                }            largest = left;        if (left < size && arr[left] > arr[largest]) {                const right = 2 * root + 2;        const left = 2 * root + 1;        let largest = root;    function heapify(size, root) {        const n = arr.length;function heapSort(arr) {```javascript**JavaScript:**```print(heap_sort(arr))  # [5, 6, 7, 11, 12, 13]arr = [12, 11, 13, 5, 6, 7]# Example    return arr            heapify(i, 0)        # Heapify reduced heap        arr[0], arr[i] = arr[i], arr[0]        # Move current root to end    for i in range(n - 1, 0, -1):    # Step 2: Extract elements one by one            heapify(n, i)    for i in range(n // 2 - 1, -1, -1):    # Step 1: Build max-heap (start from last non-leaf)                heapify(size, largest)            arr[root], arr[largest] = arr[largest], arr[root]        if largest != root:        # If largest is not root, swap and continue heapifying                    largest = right        if right < size and arr[right] > arr[largest]:        # Compare with right child                    largest = left        if left < size and arr[left] > arr[largest]:        # Compare with left child                right = 2 * root + 2        left = 2 * root + 1        largest = root        """        'size' is the number of elements in the heap.        Maintain max-heap property for subtree rooted at 'root'.        """    def heapify(size: int, root: int) -> None:        n = len(arr)    """    Stable: No    Space: O(1) (in-place)    Time: O(n log n) always        Heap Sort - in-place sort using max-heap.    """def heap_sort(arr: list[int]) -> list[int]:```python**Python:**### Standard Heap Sort## 💻 Code Implementation---```Result: [5, 4, 3, 1]    1     /      4   3               / \                 5          1 is a leaf, done    4     /      1   3        Swap 1 with 4       / \         max(4) = 4 > 1        5          Compare with children    4     /      5   3        Swap 1 with 5       / \         max(5, 3) = 5 > 1        1          Compare with childrenHeapify index 0 in [1, 5, 3, 4]:```### Visualization: Heapify Down```Done: [1, 3, 4, 5, 10]                [1, 3, 4, 5, 10]  (3, 4, 5, 10 sorted)Step 4: Swap root (3)                Heapify [3, 1]: [3, 1]        [3, 1, 4, 5, 10]  (4, 5, 10 sorted)Step 3: Swap root (4)                Heapify [1, 4, 3]: [4, 1, 3]        [1, 4, 3, 5, 10]  (5, 10 sorted)Step 2: Swap root (5) with last unsorted                Heapify [1, 5, 3, 4]: [5, 4, 3, 1]        [1, 5, 3, 4, 10]  (10 is sorted)Step 1: Swap root (10) with last elementHeap: [10, 5, 3, 4, 1]```### Step 2: Extract and Sort```Max-Heap: [10, 5, 3, 4, 1]            4   1             / \              5      3               /    \After heapify:   10        5    1         /  \          10     3            /   \As tree:      4Original: [4, 10, 3, 5, 1]```Transform array into a max-heap (parent ≥ children):### Step 1: Build Max-Heap## 📐 How It Works---</details>- Priority Queue (heap) is very common in interviews- Heap Sort is rarely used in practice**Related concepts:**- Median in stream- Top K problems (use heap data structure)- Priority Queue implementations**After mastering this:**- Complete binary tree concept- [Binary Heap basics](../.../08-Heaps-Priority-Queues/08-Heaps-Priority-Queues.md)**Before this:**<summary><strong>Prerequisites & Next Steps</strong></summary><details>## 🔗 Concept Map---| Streaming kth element | Heap (data structure) | Heap Sort needs all data || Linked lists | Merge Sort | Heap needs random access || Nearly sorted data | Insertion Sort | O(n) best case || Good average performance | Quick Sort | Better cache locality || Need stability | Merge Sort | Heap Sort not stable ||-----------|-------------|-----|| Situation | Use Instead | Why |## ❌ When NOT to Use---- **When stability doesn't matter**- **Embedded systems** - predictable memory usage- **Guaranteed O(n log n) needed** - no worst case degradation- **Strict O(1) space required** - only option for in-place O(n log n)## ✅ When to Use---</details>```Right child: 2i + 2Left child: 2i + 1Parent of i: (i-1) // 2Array representation: [16, 14, 10, 8, 7, 9, 3, 2, 4]  2   4   / \    8   7 9   3     / \   / \      14   10       /  \        16Max-Heap Property: Parent ≥ Children```**Key insight:**- "Kth largest" (heap, not heap sort)- "Memory limited"- "Guaranteed O(n log n)"- "Sort in-place"**Keywords:**<summary><strong>When to Use Heap Sort</strong></summary><details>## 🎯 Pattern Recognition---Heap Sort guarantees O(n log n) time with O(1) extra space, making it unique among comparison sorts.4. **Repeat** until sorted3. **Heapify** the reduced heap2. **Extract maximum** (root) and place at end1. **Build a max-heap** from the input array**Heap Sort** uses a binary heap data structure to sort:## Overview---> **Characteristics:** O(n log n) guaranteed, O(1) space, Not stable> **Interview Value:** ⭐⭐⭐ - Know for completeness  > **In-Place O(n log n) with Guaranteed Performance**  > **Created:** 2026-01-27
> **Status:** In Progress
> **Total Files:** 16

---

## Phase 1: Folder Structure

- [x] 1.1 Create topic folder: `03-Sorting-Searching/`
- [x] 1.2 Copy original as index
- [x] 1.3 Create `01-Sorting/` and `1.2-Basic-Sorting/`
- [x] 1.4 Create `02-Searching/` and `2.2-Binary-Search-Patterns/`
- [x] 1.5 Create `03-Cyclic-Sort/`

---

## Phase 2: HIGH PRIORITY - Binary Search ⭐

> Binary Search = ~15% of interview problems. HIGHEST ROI in this unit.

| # | File Path | Status | Lines |
|---|-----------|--------|-------|
| 2.1 | `02-Searching/2.1-Binary-Search-Basics.md` | ✅ | ~400 |
| 2.2 | `02-Searching/2.2-Binary-Search-Patterns/01-Exact-Match.md` | ✅ | ~350 |
| 2.3 | `02-Searching/2.2-Binary-Search-Patterns/02-Boundary-Search.md` | ✅ | ~420 |
| 2.4 | `02-Searching/2.2-Binary-Search-Patterns/03-Rotated-Arrays.md` | ✅ | ~450 |
| 2.5 | `02-Searching/2.2-Binary-Search-Patterns/04-Search-On-Answer.md` | ✅ | ~480 |
| 2.6 | `02-Searching/2.2-Binary-Search-Patterns/05-2D-Matrix-Search.md` | ✅ | ~420 |
| 2.7 | `02-Searching/2.3-Advanced-Binary-Search.md` | ✅ | ~450 |

---

## Phase 3: Sorting Foundation

| # | File Path | Status | Lines |
|---|-----------|--------|-------|
| 3.1 | `01-Sorting/1.1-Sorting-Basics.md` | ✅ | ~400 |
| 3.2 | `01-Sorting/1.2-Basic-Sorting/01-Bubble-Selection-Insertion.md` | ✅ | ~450 |
| 3.3 | `01-Sorting/1.3-Merge-Sort.md` | ✅ | ~500 |
| 3.4 | `01-Sorting/1.4-Quick-Sort.md` | ✅ | ~520 |
| 3.5 | `01-Sorting/1.5-Heap-Sort.md` | ✅ | Complete |
| 3.6 | `01-Sorting/1.6-Linear-Time-Sorting.md` | ✅ | Complete |
| 3.7 | `01-Sorting/1.7-Sorting-Problems.md` | ✅ | Complete |

---

## Phase 4: Cyclic Sort Pattern

| # | File Path | Status | Lines |
|---|-----------|--------|-------|
| 4.1 | `03-Cyclic-Sort/3.1-Cyclic-Sort-Pattern.md` | ✅ | Complete |
| 4.2 | `03-Cyclic-Sort/3.2-Missing-Duplicate-Problems.md` | ✅ | Complete |

---

## Phase 5: Validation

- [x] 5.1 All 16 files exist
- [x] 5.2 Each file has 12+ template sections
- [x] 5.3 Python + JavaScript code in all files
- [x] 5.4 LeetCode links verified

---

## Resources to Use

**From data/problems.json:**
- Binary Search, Search Insert Position, Sqrt(x) (Basic BS)
- Find First and Last Position (Boundary BS)
- Search in Rotated Sorted Array I/II (Rotated)
- Koko Eating Bananas, Capacity to Ship (BS on Answer)
- Search a 2D Matrix I/II (2D BS)
- Median of Two Sorted Arrays (Advanced)
- Sort Colors, Merge Intervals (Sorting)

**From topic file Learning Resources:**
- NeetCode - Binary Search Playlist
- Striver - Sorting & Binary Search Series
- Abdul Bari - Visual explanations
- Tech Interview Handbook - Binary Search Patterns
- GeeksforGeeks - All algorithms

---

## Priority Order

1. **Binary Search Basics** - Foundation for everything
2. **Boundary Search (first/last)** - Most common variation
3. **Search on Answer** - HIGH interview frequency
4. **Rotated Arrays** - FAANG favorite
5. **Merge Sort / Quick Sort** - Divide & Conquer essentials
6. **Cyclic Sort** - Grokking pattern for missing/duplicate

---

## Template Reminder

Every file MUST have these 16 sections:
1. Definition/Overview
2. 🎯 Pattern Recognition
3. ✅ When to Use
4. ❌ When NOT to Use
5. 🔗 Concept Map
6. 📐 How It Works
7. 💻 Code Implementation (Python + JS)
8. ⚡ Complexity Analysis
9. 🔄 Variations
10. ⚠️ Common Mistakes
11. 📝 Practice Problems
12. 🧠 Spaced Repetition
13. 🎤 Interview Context
14. ⏱️ Time Estimates
15. 💡 Key Insight
16. 🔗 Related
