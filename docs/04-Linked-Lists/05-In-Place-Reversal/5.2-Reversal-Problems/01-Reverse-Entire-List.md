# 01 - Reverse Entire Linked List (LeetCode 206)

> **Pattern:** In-Place Reversal (Grokking #6)  
> **Difficulty:** Easy  
> **Companies:** Amazon, Meta, Google, Microsoft, Apple

---

## Overview

Given the head of a singly linked list, reverse the list and return the reversed list. This is one of the most fundamental linked list problems and a building block for many harder problems.

**Why This Matters:** This problem tests your understanding of pointer manipulation - one of the core skills for linked list problems. It's often the first question in a linked list interview or a stepping stone to harder problems.

---

## 🎯 Pattern Recognition

<details>
<summary><strong>How to Identify This Pattern</strong></summary>

**Look for these signals:**
- "Reverse a linked list"
- "Return the list in reverse order"
- Need to change direction of traversal
- Building block for other problems (palindrome, reorder)

**Keywords in problem statement:**
- "reverse", "reversed"
- "in-place" (no extra list)
- "return the head of the reversed list"

**Immediate recognition:**
When you see "reverse linked list" → Three-pointer technique (prev, current, next)

</details>

---

## ✅ When to Use

- Reversing an entire singly linked list
- As a subroutine in palindrome checking
- Part of reorder list problems
- When you need to traverse backward (singly linked list)

---

## ❌ When NOT to Use

| Scenario | Why Not | Use Instead |
|----------|---------|-------------|
| Only printing in reverse | Modification not needed | Stack or recursion |
| Doubly linked list | Can traverse backward already | Simple backward traversal |
| Partial reversal needed | This reverses entire list | Reverse Between technique |
| Need to preserve original | This modifies in-place | Copy to new list first |

---

## 🔗 Concept Map

<details>
<summary><strong>Prerequisites & Next Steps</strong></summary>

**Before this, you should know:**
- [Linked List Basics](../../01-Singly-LL/1.1-Basics.md) - Node structure
- [Traversal](../../01-Singly-LL/1.2-Operations.md) - Walking through list
- [Pointer concepts](../../01-Singly-LL/1.1-Basics.md) - References vs values

**After mastering this:**
- [Reverse Between (LC 92)](./02-Reverse-Between.md) - Partial reversal
- [Reverse K-Group (LC 25)](./03-Reverse-K-Group.md) - Group reversal
- Palindrome Linked List (LC 234) - Uses this as subroutine

**Combines with:**
- Fast & Slow pointer for finding middle
- Merge for reorder list
- Recursion for elegant solutions

</details>

---

## 📐 How It Works

### The Three-Pointer Approach

```
We need three pointers:
- prev: already reversed portion (starts null)
- curr: current node being processed  
- next: saved next node (before we overwrite curr.next)

Original: 1 → 2 → 3 → null

Iteration 1:
  prev=null, curr=1, next=2
  
  Before: null   1 → 2 → 3 → null
                 ↑
                curr
  
  After:  null ← 1   2 → 3 → null
                 ↑   ↑
               prev curr

Iteration 2:
  prev=1, curr=2, next=3
  
  After:  null ← 1 ← 2   3 → null
                     ↑   ↑
                   prev curr

Iteration 3:
  prev=2, curr=3, next=null
  
  After:  null ← 1 ← 2 ← 3   null
                         ↑    ↑
                       prev  curr

curr is null → DONE
Return prev (new head = 3)

Result: 3 → 2 → 1 → null
```

### The Four Steps Per Iteration

1. **Save next**: `next = curr.next` (don't lose the rest!)
2. **Reverse link**: `curr.next = prev`
3. **Move prev**: `prev = curr`
4. **Move curr**: `curr = next`

---

## 💻 Code Implementation

### Solution 1: Iterative (Recommended for Interviews)

**Python:**
```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


def reverse_list(head: ListNode) -> ListNode:
    """
    Reverse a singly linked list.
    
    Pattern: In-Place Reversal
    Time: O(n), Space: O(1)
    
    Uses three pointers to reverse links one by one.
    """
    prev = None
    curr = head
    
    while curr:
        # 1. Save next (before we lose it)
        next_node = curr.next
        
        # 2. Reverse the link
        curr.next = prev
        
        # 3. Move prev forward
        prev = curr
        
        # 4. Move curr forward
        curr = next_node
    
    # prev is now pointing to the old tail (new head)
    return prev
```

**JavaScript:**
```javascript
class ListNode {
    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

/**
 * Reverse a singly linked list.
 * Pattern: In-Place Reversal
 * Time: O(n), Space: O(1)
 * 
 * @param {ListNode} head
 * @return {ListNode}
 */
function reverseList(head) {
    let prev = null;
    let curr = head;
    
    while (curr) {
        const nextNode = curr.next;  // Save
        curr.next = prev;            // Reverse
        prev = curr;                 // Move prev
        curr = nextNode;             // Move curr
    }
    
    return prev;
}
```

### Solution 2: Recursive

**Python:**
```python
def reverse_list_recursive(head: ListNode) -> ListNode:
    """
    Reverse a singly linked list recursively.
    
    Time: O(n), Space: O(n) - call stack
    
    Elegant but uses O(n) space for call stack.
    """
    # Base case: empty or single node
    if not head or not head.next:
        return head
    
    # Recursively reverse the rest
    # After this, the rest is reversed and new_head points to the last node
    new_head = reverse_list_recursive(head.next)
    
    # Now we need to reverse the link between head and head.next
    # head.next is the last node of the reversed portion
    head.next.next = head  # Make the next node point back to us
    head.next = None       # We're now the tail, point to null
    
    return new_head  # Always return the new head (originally last node)


# Trace for [1, 2, 3]:
# 
# reverse(1):
#   reverse(2):
#     reverse(3):
#       Base case! Return 3 (head.next is None)
#     new_head = 3
#     2.next.next = 2  →  3.next = 2  →  3 → 2
#     2.next = None    →  2 → null
#     Return 3
#   new_head = 3
#   1.next.next = 1  →  2.next = 1  →  3 → 2 → 1
#   1.next = None    →  1 → null
#   Return 3
# 
# Result: 3 → 2 → 1 → null
```

**JavaScript:**
```javascript
function reverseListRecursive(head) {
    // Base case
    if (!head || !head.next) {
        return head;
    }
    
    // Reverse the rest
    const newHead = reverseListRecursive(head.next);
    
    // Reverse the link
    head.next.next = head;
    head.next = null;
    
    return newHead;
}
```

### Solution 3: Using Stack (Not Recommended, but Valid)

**Python:**
```python
def reverse_list_stack(head: ListNode) -> ListNode:
    """
    Reverse using a stack.
    Time: O(n), Space: O(n)
    
    Not recommended - just for understanding.
    """
    if not head:
        return None
    
    # Push all nodes onto stack
    stack = []
    curr = head
    while curr:
        stack.append(curr)
        curr = curr.next
    
    # Pop and link
    new_head = stack.pop()
    curr = new_head
    
    while stack:
        curr.next = stack.pop()
        curr = curr.next
    
    curr.next = None  # Important: terminate the list
    
    return new_head
```

---

## ⚡ Complexity Analysis

| Approach | Time | Space | Notes |
|----------|------|-------|-------|
| Iterative | O(n) | O(1) | **Optimal** |
| Recursive | O(n) | O(n) | Call stack overhead |
| Stack | O(n) | O(n) | Extra data structure |

**Detailed Analysis (Iterative):**
- **Time O(n):** Each node is visited exactly once
- **Space O(1):** Only 3 pointer variables (prev, curr, next), regardless of list size

**Why Iterative is Best:**
- Same time as recursive
- Better space (O(1) vs O(n))
- No stack overflow risk for very long lists
- Easier to trace and debug

---

## 🔄 Variations

| Variation | Difference | LeetCode |
|-----------|------------|----------|
| Entire list | This problem | LC 206 |
| Between positions | Partial reversal | LC 92 |
| K-group | Chunks of k | LC 25 |
| Swap pairs | k = 2 | LC 24 |
| Alternate groups | Reverse every other | Custom |

---

## ⚠️ Common Mistakes

### 1. Forgetting to Save Next

```python
# ❌ Wrong - loses the rest of the list
while curr:
    curr.next = prev      # Now curr.next is prev, not original next!
    prev = curr
    curr = curr.next      # This now points to prev, not forward!

# ✅ Correct - save next first
while curr:
    next_node = curr.next  # Save before overwriting
    curr.next = prev
    prev = curr
    curr = next_node
```

### 2. Returning Wrong Pointer

```python
# ❌ Wrong - curr is null at the end
return curr  # Returns None!

# ❌ Also wrong - head is now the tail
return head  # Returns the old head, now pointing to null

# ✅ Correct - prev is the new head
return prev
```

### 3. Missing Base Case in Recursive

```python
# ❌ Wrong - no base case
def reverse(head):
    new_head = reverse(head.next)  # What if head is None? Crash!
    # ...

# ✅ Correct - handle base cases
def reverse(head):
    if not head or not head.next:  # Empty or single node
        return head
    new_head = reverse(head.next)
    # ...
```

### 4. Creating a Cycle in Recursive

```python
# ❌ Wrong - creates cycle 1 ↔ 2
def reverse(head):
    if not head or not head.next:
        return head
    new_head = reverse(head.next)
    head.next.next = head
    # Missing: head.next = None
    return new_head

# ✅ Correct - break the forward link
def reverse(head):
    if not head or not head.next:
        return head
    new_head = reverse(head.next)
    head.next.next = head
    head.next = None  # Prevents cycle!
    return new_head
```

---

## 📝 Practice Problems (Progressive)

### Easy (This problem)
- [ ] [Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/) - LC 206 - This problem!

### Medium (Apply the skill)
- [ ] [Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/) - LC 92 - Partial reversal
- [ ] [Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/) - LC 24 - k=2
- [ ] [Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/) - LC 234 - Uses reversal

### Hard (Master)
- [ ] [Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group/) - LC 25 - Full k-group

<details>
<summary><strong>🧠 Spaced Repetition Schedule</strong></summary>

**For LC 206 (Reverse Linked List):**
- **Day 1:** Solve iteratively AND recursively
- **Day 3:** Explain the three pointers out loud
- **Day 7:** Solve LC 92 (reverse between)
- **Day 14:** Solve LC 234 (palindrome) using this
- **Day 30:** Solve LC 25 (k-group)

**Speed targets:**
- First time: 10-15 min
- After practice: 3-5 min
- Interview: 5-8 min (with explanation)

</details>

---

## 🎤 Interview Context

<details>
<summary><strong>How to Communicate This in Interviews</strong></summary>

**Opening (30 seconds):**
"I'll reverse the list in-place using three pointers: prev, current, and next. I'll reverse one link at a time as I traverse."

**While coding (explain as you write):**
1. "I initialize prev to null and current to head"
2. "In each iteration, I first save the next node so I don't lose it"
3. "Then I reverse the current link to point to prev"
4. "Finally I move both pointers forward"
5. "When current becomes null, prev is my new head"

**After coding:**
"Let me trace through with [1, 2, 3]..."
"Edge cases: empty list returns null, single node returns itself"

**Follow-up questions:**
- "Can you do it recursively?" → Yes, show recursive solution
- "What's the space complexity?" → O(1) iterative, O(n) recursive
- "Can you reverse only part of the list?" → Yes, that's LC 92

</details>

**Company Focus:**

| Company | Frequency | Notes |
|---------|-----------|-------|
| Amazon | ⭐⭐⭐⭐⭐ | VERY common |
| Meta | ⭐⭐⭐⭐⭐ | Often a warm-up |
| Google | ⭐⭐⭐⭐ | May ask recursive |
| Microsoft | ⭐⭐⭐⭐⭐ | Standard question |
| Apple | ⭐⭐⭐⭐ | Foundation check |

---

## ⏱️ Time Estimates

| Activity | Time | Notes |
|----------|------|-------|
| First solve | 10-15 min | Understanding pointers |
| After learning | 5-8 min | With explanation |
| Speed target | 3-5 min | Without explanation |
| With follow-ups | 12-15 min | Both solutions + edge cases |

---

> **💡 Key Insight:** The key is the ORDER of operations: save → reverse → move. If you forget to save the next node before reversing, you lose the rest of the list. Always draw the pointers before coding!

---

## 🔗 Related

- [In-Place Reversal Technique](../5.1-Reversal-Technique.md) - Pattern overview
- [Reverse Between (LC 92)](./02-Reverse-Between.md) - Partial reversal
- [Reverse K-Group (LC 25)](./03-Reverse-K-Group.md) - Group reversal
- [Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/) - Uses reversal
