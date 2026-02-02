---
sidebar_position: 1
sidebar_label: Greedy Algorithms
slug: /12-Greedy-Algorithms
---

# 12 - Greedy Algorithms

> Make locally optimal choices hoping for global optimum
>
> 📚 *Includes Grokking Pattern #23: Greedy Algorithms, Pattern #4: Merge Intervals*
>
> ⚠️ *AlgoMonster Note: Greedy has LOW ROI - each problem is unique, hard to generalize*
>
> ⏱️ *Estimated: 1-2 weeks*

```mermaid
flowchart LR
    A[10-Graphs] --> B[12-Greedy]
    B --> C[14-Advanced-DS]
    style B fill:#90caf9
```

---

## 1. Greedy Basics

### 1.1 What is Greedy?
- [ ] Make best choice at each step
- [ ] Never reconsider previous choices
- [ ] Hope local optimum leads to global optimum
- [ ] Not always optimal, but often efficient

### 1.2 When Does Greedy Work?
- [ ] Greedy Choice Property: local optimal → global optimal
- [ ] Optimal Substructure: optimal solution contains optimal sub-solutions
- [ ] Problem has "greedy stays ahead" proof

### 1.3 Greedy vs DP
| Aspect | Greedy | DP |
|--------|--------|-----|
| Approach | Make one choice, move on | Consider all choices |
| Subproblems | One subproblem after choice | Multiple subproblems |
| Time | Usually faster | Usually slower |
| Correctness | May not be optimal | Always optimal |

---

## 2. Greedy Proof Techniques

### 2.1 Greedy Stays Ahead
- [ ] Show greedy solution stays ≥ any other solution at each step
- [ ] By induction, greedy is optimal at the end

### 2.2 Exchange Argument
- [ ] Assume optimal solution differs from greedy
- [ ] Show we can exchange to match greedy without worsening
- [ ] Conclude greedy is also optimal

---

## 3. Classic Greedy Problems

### 3.1 Activity Selection / Interval Scheduling
- [ ] Select maximum non-overlapping activities
- [ ] Sort by end time
- [ ] Greedily select earliest ending
- [ ] Pattern: Sort by end → Take first → Take next non-overlapping

### 3.2 Fractional Knapsack
- [ ] Can take fractions of items
- [ ] Sort by value/weight ratio
- [ ] Take highest ratio items first

### 3.3 Huffman Coding
- [ ] Optimal prefix-free encoding
- [ ] Build tree using min-heap
- [ ] Frequent chars get shorter codes

### 3.4 Job Sequencing
- [ ] Jobs with deadlines and profits
- [ ] Maximize total profit
- [ ] Sort by profit, schedule greedily

---

## 4. Greedy Problems by Category

### 4.1 Interval Problems
- [ ] Merge Intervals
- [ ] Insert Interval
- [ ] Non-overlapping Intervals
- [ ] Meeting Rooms
- [ ] Meeting Rooms II
- [ ] Minimum Number of Arrows to Burst Balloons
- [ ] Interval List Intersections
- [ ] Maximum Length of Pair Chain
- [ ] Video Stitching

### 4.2 Scheduling Problems
- [ ] Task Scheduler
- [ ] Reorganize String
- [ ] Course Schedule III
- [ ] Car Pooling
- [ ] Maximum Number of Events
- [ ] Single-Threaded CPU

### 4.3 Array Greedy
- [ ] Jump Game
- [ ] Jump Game II
- [ ] Gas Station
- [ ] Candy
- [ ] Best Time to Buy and Sell Stock II
- [ ] Container with Most Water
- [ ] Assign Cookies
- [ ] Lemonade Change
- [ ] Boats to Save People

### 4.4 String Greedy
- [ ] Remove Duplicate Letters
- [ ] Remove K Digits
- [ ] Create Maximum Number
- [ ] Smallest Subsequence of Distinct Characters
- [ ] Partition Labels
- [ ] Reorganize String

### 4.5 Two Pointer Greedy
- [ ] Two Sum II
- [ ] Three Sum
- [ ] Container with Most Water
- [ ] Trapping Rain Water

---

## 5. Greedy Patterns

### 5.1 Sort Then Greedy
- [ ] Sort by some criteria
- [ ] Process in order
- [ ] Make greedy choice
- [ ] Pattern: Sort by criteria → Iterate items → If valid, take it → Accumulate result

### 5.2 Heap-Based Greedy
- [ ] Use heap for dynamic min/max
- [ ] Process in priority order
- [ ] Update heap as needed
- [ ] Pattern: Build heap → Pop best → Process → Re-insert if needed

### 5.3 Two Extremes
- [ ] Consider smallest and largest
- [ ] Process from both ends
- [ ] Match optimally

### 5.4 Local to Global
- [ ] Track local optimal
- [ ] Update global when local is complete

---

## 6. Common Greedy Techniques

### 6.1 Sort by End Time
- [ ] Interval scheduling
- [ ] Activity selection
- [ ] Non-overlapping intervals

### 6.2 Sort by Start Time
- [ ] Merge intervals
- [ ] Meeting rooms (with heap)

### 6.3 Sort by Ratio
- [ ] Fractional knapsack (value/weight)
- [ ] Job sequencing (profit/time)

### 6.4 Sort by Deadline
- [ ] Job sequencing with deadlines
- [ ] Task scheduling

### 6.5 Process Smallest/Largest First
- [ ] Assign cookies
- [ ] Boats to save people

---

## 7. Greedy on Graphs

### 7.1 Minimum Spanning Tree
- [ ] Kruskal's Algorithm (sort edges)
- [ ] Prim's Algorithm (min-heap)
- [ ] Min Cost to Connect Points
- [ ] Connecting Cities

### 7.2 Shortest Path (Dijkstra)
- [ ] Greedy selection of nearest node
- [ ] Network Delay Time
- [ ] Path with Minimum Effort

### 7.3 Other Graph Greedy
- [ ] Cheapest Flights Within K Stops
- [ ] Optimize Water Distribution

---

## 8. Advanced Greedy

### 8.1 Matroid Theory (Concept)
- [ ] When greedy gives optimal
- [ ] Independence system
- [ ] Exchange property

### 8.2 Greedy + Binary Search
- [ ] Binary search on answer
- [ ] Check feasibility greedily

### 8.3 Greedy + DP Hybrid
- [ ] Some problems need both
- [ ] Use greedy for decisions
- [ ] Use DP for counting

---

## 9. Problems Collection

### 9.1 Easy
- [ ] Assign Cookies
- [ ] Lemonade Change
- [ ] Best Time to Buy and Sell Stock II
- [ ] Maximum Subarray (Kadane's)
- [ ] Valid Parenthesis String

### 9.2 Medium
- [ ] Jump Game
- [ ] Jump Game II
- [ ] Gas Station
- [ ] Partition Labels
- [ ] Merge Intervals
- [ ] Non-overlapping Intervals
- [ ] Queue Reconstruction by Height
- [ ] Task Scheduler
- [ ] Minimum Number of Arrows
- [ ] Car Pooling

### 9.3 Hard
- [ ] Candy
- [ ] Create Maximum Number
- [ ] Remove K Digits
- [ ] IPO
- [ ] Course Schedule III
- [ ] Minimum Cost to Hire K Workers
- [ ] Patching Array

---

## 📚 Learning Resources

### Videos
- [NeetCode - Greedy Algorithms Playlist](https://www.youtube.com/@NeetCode) - Greedy approach and interval problems
- [Striver - Greedy Series](https://www.youtube.com/@takeUforward) - Activity selection and greedy patterns
- [Abdul Bari - Greedy Algorithms](https://www.youtube.com/@abdul_bari) - Greedy fundamentals and classic problems

### Articles
- [GeeksforGeeks - Greedy Algorithms](https://www.geeksforgeeks.org/greedy-algorithms/) - Greedy approach, interval problems, activity selection
- [Tech Interview Handbook - Greedy](https://www.techinterviewhandbook.org/algorithms/sorting-searching/) - Greedy patterns and interview techniques

---

## Thinking Framework

### Greedy Recognition
1. Optimization problem (min/max)
2. Making sequential choices
3. Local choice seems obvious
4. Can't "undo" previous choices

### How to Verify Greedy?
1. Try to find counterexample
2. Think: "Does greedy stay ahead?"
3. Consider: "Can I exchange choices?"
4. If stuck, might need DP

### Common Mistakes
1. Assuming greedy works without proof
2. Wrong sorting criteria
3. Not handling edge cases
4. Forgetting ties

---

## 10. Interview Focus

### 10.1 Things to Look Out For
- [ ] Greedy doesn't always work - verify with counterexamples first
- [ ] Think about the sorting criteria carefully
- [ ] Ask: "Does local optimal lead to global optimal?"
- [ ] If greedy fails, consider DP

### 10.2 Corner Cases
- [ ] Empty input
- [ ] Single element
- [ ] All elements same
- [ ] Overlapping intervals at boundaries
- [ ] Ties in sorting criteria

### 10.3 Common Mistakes
- [ ] Assuming greedy works without proof
- [ ] Wrong sorting order (ascending vs descending)
- [ ] Not handling ties properly
- [ ] Off-by-one in interval boundaries

### 10.4 Greedy vs DP Decision
| Use Greedy when... | Use DP when... |
|-------------------|---------------|
| Local choice = global optimal | Need to try all choices |
| Can prove "greedy stays ahead" | Overlapping subproblems |
| "Exchange argument" works | Counting problems |
| Interval scheduling type | Optimization with constraints |

### 10.5 Common Greedy Strategies
| Strategy | Example Problems |
|----------|------------------|
| Sort by end time | Activity selection, Non-overlapping intervals |
| Sort by start time | Merge intervals, Meeting rooms |
| Sort by ratio | Fractional knapsack |
| Process smallest/largest first | Assign cookies, Boats |

---

## 11. Essential LeetCode Problems

### 11.1 Interval Problems

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Merge Intervals](https://leetcode.com/problems/merge-intervals/) | LeetCode #56 | 🟡 Medium | Sort by start, merge overlapping |
| [Insert Interval](https://leetcode.com/problems/insert-interval/) | LeetCode #57 | 🟡 Medium | Find insertion point, merge |
| [Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/) | LeetCode #435 | 🟡 Medium | Sort by end, count removals |
| [Meeting Rooms](https://leetcode.com/problems/meeting-rooms/) | LeetCode #252 | 🟢 Easy | Sort by start, check overlap |
| [Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/) | LeetCode #253 | 🟡 Medium | Min-heap for end times |
| [Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/) | LeetCode #452 | 🟡 Medium | Sort by end, count groups |

### 11.2 Jump & Traversal Problems

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Jump Game](https://leetcode.com/problems/jump-game/) | LeetCode #55 | 🟡 Medium | Track max reachable index |
| [Jump Game II](https://leetcode.com/problems/jump-game-ii/) | LeetCode #45 | 🟡 Medium | BFS/Greedy, track farthest |
| [Gas Station](https://leetcode.com/problems/gas-station/) | LeetCode #134 | 🟡 Medium | Track surplus, find start |
| [Candy](https://leetcode.com/problems/candy/) | LeetCode #135 | 🔴 Hard | Two-pass: left-to-right, right-to-left |
| [Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/) | LeetCode #122 | 🟡 Medium | Sum all positive differences |

### 11.3 Scheduling Problems

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Task Scheduler](https://leetcode.com/problems/task-scheduler/) | LeetCode #621 | 🟡 Medium | Count max freq, calculate idle |
| [Partition Labels](https://leetcode.com/problems/partition-labels/) | LeetCode #763 | 🟡 Medium | Track last occurrence |
| [Reorganize String](https://leetcode.com/problems/reorganize-string/) | LeetCode #767 | 🟡 Medium | Max-heap, alternate chars |
| [Course Schedule III](https://leetcode.com/problems/course-schedule-iii/) | LeetCode #630 | 🔴 Hard | Sort by deadline, max-heap |
| [Car Pooling](https://leetcode.com/problems/car-pooling/) | LeetCode #1094 | 🟡 Medium | Difference array / sorting |

### 11.4 Additional Greedy Problems

| Problem | Platform | Difficulty | Pattern |
|---------|----------|------------|--------|
| [Assign Cookies](https://leetcode.com/problems/assign-cookies/) | LeetCode #455 | 🟢 Easy | Sort both, two pointers |
| [Lemonade Change](https://leetcode.com/problems/lemonade-change/) | LeetCode #860 | 🟢 Easy | Greedy change-making |
| [Queue Reconstruction by Height](https://leetcode.com/problems/queue-reconstruction-by-height/) | LeetCode #406 | 🟡 Medium | Sort desc height, insert by k |
| [Remove K Digits](https://leetcode.com/problems/remove-k-digits/) | LeetCode #402 | 🟡 Medium | Monotonic stack |
| [IPO](https://leetcode.com/problems/ipo/) | LeetCode #502 | 🔴 Hard | Two heaps |
| [Minimum Cost to Hire K Workers](https://leetcode.com/problems/minimum-cost-to-hire-k-workers/) | LeetCode #857 | 🔴 Hard | Sort by ratio, max-heap |

---

## Checklist Summary

| Topic | Status |
|-------|--------|
| Greedy Basics | ⬜ |
| Activity Selection | ⬜ |
| Fractional Knapsack | ⬜ |
| Interval Problems | ⬜ |
| Scheduling Problems | ⬜ |
| Array Greedy | ⬜ |
| String Greedy | ⬜ |
| Heap-Based Greedy | ⬜ |
| Graph Greedy (MST) | ⬜ |
| Sort Then Greedy | ⬜ |
| **Interview Edge Cases** | ⬜ |
| **Essential Problems (10)** | ⬜ |

---

**Previous:** [11-Dynamic-Programming.md](.../11-Dynamic-Programming/11-Dynamic-Programming.md)  
**Next:** [13-Tries.md](../13-Tries.md)
