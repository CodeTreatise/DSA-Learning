---
sidebar_position: 1
sidebar_label: Linked Lists
slug: /04-Linked-Lists
---

# 04 - Linked Lists

> Dynamic data structure with non-contiguous memory allocation
>
> ✅ *Includes Grokking Patterns: #2 Fast & Slow Pointers, #6 In-place Reversal*
>
> ⏱️ *Estimated: 1-2 weeks*

```mermaid
flowchart LR
    A[03-Sorting/Searching] --> B[04-Linked-Lists]
    B --> C[06-Trees]
    style B fill:#90caf9
```

---

## 1. Singly Linked List

### 1.1 Basics
- [ ] What is a Linked List?
- [ ] Node structure (data + next pointer)
- [ ] Head pointer
- [ ] Linked List vs Array comparison
- [ ] When to use Linked List

### 1.2 Implementation
- [ ] Node class
- [ ] LinkedList class
- [ ] Creating a linked list

### 1.3 Basic Operations
- [ ] Traversal - O(n)
- [ ] Insertion at beginning - O(1)
- [ ] Insertion at end - O(n) or O(1) with tail
- [ ] Insertion at position - O(n)
- [ ] Deletion from beginning - O(1)
- [ ] Deletion from end - O(n)
- [ ] Deletion by value - O(n)
- [ ] Deletion at position - O(n)
- [ ] Search - O(n)
- [ ] Get length - O(n) or O(1)
- [ ] Check if empty - O(1)

### 1.4 Basic Problems
- [ ] Print linked list
- [ ] Find length
- [ ] Search element
- [ ] Get Nth node
- [ ] Get Nth node from end
- [ ] Find middle element
- [ ] Count occurrences

---

## 2. Doubly Linked List

### 2.1 Basics
- [ ] Node structure (prev + data + next)
- [ ] Advantages over singly linked list
- [ ] Disadvantages

### 2.2 Implementation
- [ ] Node class
- [ ] DoublyLinkedList class

### 2.3 Operations
- [ ] Traversal (forward & backward)
- [ ] Insertion at beginning - O(1)
- [ ] Insertion at end - O(1) with tail
- [ ] Insertion at position - O(n)
- [ ] Deletion from beginning - O(1)
- [ ] Deletion from end - O(1) with tail
- [ ] Deletion by value - O(n)

---

## 3. Circular Linked List

### 3.1 Singly Circular Linked List
- [ ] Structure (last node points to first)
- [ ] Implementation
- [ ] Operations
- [ ] Use cases

### 3.2 Doubly Circular Linked List
- [ ] Structure
- [ ] Implementation
- [ ] Operations

---

## 4. Fast & Slow Pointer (Tortoise & Hare)

### 4.1 Concept
- [ ] Two pointers moving at different speeds
- [ ] Detecting cycles
- [ ] Finding middle element
- [ ] Floyd's Cycle Detection

### 4.2 Problems
- [ ] Find middle of linked list
- [ ] Detect cycle in linked list
- [ ] Find start of cycle
- [ ] Find cycle length
- [ ] Happy Number
- [ ] Find the Duplicate Number

---

## 5. Linked List Problems by Category

### 5.1 Reversal Problems
- [ ] Reverse a linked list (iterative)
- [ ] Reverse a linked list (recursive)
- [ ] Reverse in groups of K
- [ ] Reverse between positions
- [ ] Reverse alternate K nodes

### 5.2 Merge & Sort Problems
- [ ] Merge two sorted lists
- [ ] Merge K sorted lists
- [ ] Sort linked list (Merge Sort)
- [ ] Insertion sort on linked list

### 5.3 Cycle Problems
- [ ] Detect cycle
- [ ] Find cycle start
- [ ] Find cycle length
- [ ] Remove cycle

### 5.4 Two Pointer Problems
- [ ] Find middle element
- [ ] Nth node from end
- [ ] Delete Nth node from end
- [ ] Check if palindrome
- [ ] Intersection of two lists
- [ ] Find merge point

### 5.5 Modification Problems
- [ ] Remove duplicates from sorted list
- [ ] Remove duplicates from unsorted list
- [ ] Remove all occurrences of value
- [ ] Delete node (given only that node)
- [ ] Partition list around value
- [ ] Odd-Even linked list
- [ ] Swap nodes in pairs
- [ ] Rotate list by K places

### 5.6 Arithmetic Problems
- [ ] Add two numbers
- [ ] Add two numbers II (reversed)
- [ ] Subtract two numbers
- [ ] Multiply two numbers

### 5.7 Advanced Problems
- [ ] Copy list with random pointer
- [ ] Flatten a multilevel list
- [ ] Flatten a linked list (sorted)
- [ ] LRU Cache implementation
- [ ] LFU Cache implementation
- [ ] Design Browser History

---

## 6. Linked List Techniques

### 6.1 Dummy Node
- [ ] When to use dummy node
- [ ] Simplifying edge cases
- [ ] Implementation pattern

### 6.2 In-place Reversal
- [ ] Three pointer technique
- [ ] prev, current, next
- [ ] Reversal pattern

### 6.3 Runner Technique
- [ ] Fast and slow pointers
- [ ] Finding middle
- [ ] Cycle detection

---

## Comparison Table

| Operation | Array | Singly LL | Doubly LL |
|-----------|-------|-----------|-----------|
| Access |" O(1) "| O(n) |" O(n) "|
| Search |" O(n) "| O(n) |" O(n) "|
| Insert (beginning) |" O(n) "| O(1) |" O(1) "|
| Insert (end) |" O(1)* "| O(n) |" O(1) "|
| Insert (middle) |" O(n) "| O(n) |" O(n) "|
| Delete (beginning) |" O(n) "| O(1) |" O(1) "|
| Delete (end) |" O(1) "| O(n) |" O(1) "|
| Delete (middle) |" O(n) "| O(n) |" O(n) "|

*with dynamic array

---

## Thinking Framework

### When to use Linked List?
1. Unknown size / dynamic size
2. Frequent insertions/deletions
3. No random access needed
4. Memory not contiguous

### Common Patterns
1. **Two Pointers** - fast/slow for cycle, middle
2. **Dummy Head** - simplify edge cases
3. **Reversal** - prev, curr, next pointers
4. **Recursion** - natural for LL problems

---

## 7. Interview Focus

### 7.1 Things to Look Out For
- [ ] Use dummy node to simplify edge cases (empty list, single node)
- [ ] Always check for null before accessing .next
- [ ] Consider both singly and doubly linked list approaches
- [ ] Draw pictures to visualize pointer movements
- [ ] Fast & slow pointer is key for many problems

### 7.2 Corner Cases
- [ ] Empty list (head = null)
- [ ] Single node list
- [ ] Two node list
- [ ] Cycle at different positions (head, middle, tail)
- [ ] No cycle exists
- [ ] Odd vs even length lists

### 7.3 Common Mistakes
- [ ] Losing reference to head
- [ ] Not updating pointers in correct order
- [ ] Null pointer exception (accessing .next of null)
- [ ] Off-by-one in length calculations
- [ ] Forgetting to handle edge cases

### 7.4 Essential Patterns
| Pattern | Use Case |
|---------|----------|
| Dummy node | Simplify insert/delete at head |
| Two pointers (fast/slow) | Find middle, detect cycle |
| In-place reversal | Reverse list or portion |
| Merge two lists | Merge sorted lists |
| Runner technique | Nth node from end |

---

## 📚 Learning Resources

### Videos
- [NeetCode - Linked List Playlist](https://www.youtube.com/@NeetCode) - All essential linked list problems
- [Striver (take U forward) - Linked List Series](https://www.youtube.com/@takeUforward) - Complete linked list for interviews
- [Abdul Bari - Linked List Fundamentals](https://www.youtube.com/@abdul_bari) - Visual explanations of concepts
- [freeCodeCamp - Linked Lists Tutorial](https://www.youtube.com/@freecodecamp) - Beginner-friendly introduction

### Articles
- [Linked List - GeeksforGeeks](https://www.geeksforgeeks.org/data-structures/linked-list/)
- [Fast and Slow Pointers - Tech Interview Handbook](https://www.techinterviewhandbook.org/algorithms/linked-list/)
- [Reverse a Linked List - GeeksforGeeks](https://www.geeksforgeeks.org/reverse-a-linked-list/)
- [Detect Loop in Linked List - GeeksforGeeks](https://www.geeksforgeeks.org/detect-loop-in-a-linked-list/)
- [Linked List Basics - Programiz](https://www.programiz.com/dsa/linked-list)
- [Floyd's Cycle Detection - GeeksforGeeks](https://www.geeksforgeeks.org/floyds-cycle-finding-algorithm/)

---

## 8. Essential Problems

### 8.1 Basic Operations

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/) | LeetCode | 🟢 Easy | In-place Reversal |
| [Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/) | LeetCode | 🟡 Medium | In-place Reversal |
| [Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list/) | LeetCode | 🟢 Easy | Fast & Slow Pointer |
| [Delete Node in a Linked List](https://leetcode.com/problems/delete-node-in-a-linked-list/) | LeetCode | 🟡 Medium | Pointer Manipulation |
| [Remove Duplicates from Sorted List](https://leetcode.com/problems/remove-duplicates-from-sorted-list/) | LeetCode | 🟢 Easy | Two Pointers |

### 8.2 Two Pointer & Cycle Detection

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/) | LeetCode | 🟢 Easy | Fast & Slow Pointer |
| [Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/) | LeetCode | 🟡 Medium | Floyd's Algorithm |
| [Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/) | LeetCode | 🟡 Medium | Two Pointers |
| [Intersection of Two Linked Lists](https://leetcode.com/problems/intersection-of-two-linked-lists/) | LeetCode | 🟢 Easy | Two Pointers |
| [Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/) | LeetCode | 🟢 Easy | Fast & Slow + Reverse |

### 8.3 Merge & Sort

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/) | LeetCode | 🟢 Easy | Merge Pattern |
| [Merge K Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/) | LeetCode | 🔴 Hard | Divide & Conquer / Heap |
| [Sort List](https://leetcode.com/problems/sort-list/) | LeetCode | 🟡 Medium | Merge Sort |

### 8.4 Advanced Operations

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Reorder List](https://leetcode.com/problems/reorder-list/) | LeetCode | 🟡 Medium | Multiple Techniques |
| [Add Two Numbers](https://leetcode.com/problems/add-two-numbers/) | LeetCode | 🟡 Medium | Math + LL |
| [Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii/) | LeetCode | 🟡 Medium | Stack + LL |
| [Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer/) | LeetCode | 🟡 Medium | HashMap / Interweaving |
| [LRU Cache](https://leetcode.com/problems/lru-cache/) | LeetCode | 🟡 Medium | Doubly LL + HashMap |

---

## Checklist Summary

| Topic | Status |
|-------|--------|
| Singly Linked List Basics | ⬜ |
| Singly LL Operations | ⬜ |
| Doubly Linked List | ⬜ |
| Circular Linked List | ⬜ |
| Fast & Slow Pointer | ⬜ |
| Reversal Problems | ⬜ |
| Merge & Sort Problems | ⬜ |
| Cycle Problems | ⬜ |
| Two Pointer Problems | ⬜ |
| Advanced Problems | ⬜ |
| **Interview Edge Cases** | ⬜ |
| **Essential Problems (9)** | ⬜ |

---

**Previous:** [03-Sorting-Searching.md](./03-Sorting-Searching.md)  
**Next:** [05-Stacks-Queues.md](./05-Stacks-Queues.md)
