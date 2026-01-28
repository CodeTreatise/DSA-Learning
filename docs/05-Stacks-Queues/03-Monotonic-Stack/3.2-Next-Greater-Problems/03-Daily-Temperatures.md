# 03 - Daily Temperatures (LC 739)

> **Grokking Pattern:** Monotonic Stack
>
> **Difficulty:** Medium | **Frequency:** ⭐⭐⭐⭐⭐ Very Common Interview Problem

---

## Problem Statement

Given an array of integers `temperatures` representing daily temperatures, return an array `answer` such that `answer[i]` is the **number of days** you have to wait after the `i`th day to get a warmer temperature.

If there is no future day with a warmer temperature, set `answer[i] = 0`.

```
Input: temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
Output: [1, 1, 4, 2, 1, 1, 0, 0]

Explanation:
- Day 0 (73°): Day 1 is warmer (74°) → wait 1 day
- Day 1 (74°): Day 2 is warmer (75°) → wait 1 day
- Day 2 (75°): Day 6 is warmer (76°) → wait 4 days
- Day 3 (71°): Day 5 is warmer (72°) → wait 2 days
- Day 4 (69°): Day 5 is warmer (72°) → wait 1 day
- Day 5 (72°): Day 6 is warmer (76°) → wait 1 day
- Day 6 (76°): No warmer day → 0
- Day 7 (73°): No warmer day → 0
```

[LeetCode 739 - Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)

---

## 🎯 Pattern Recognition

<details>
<summary><strong>How to Identify This Pattern</strong></summary>

**Look for these signals:**
- "Next warmer/greater/higher" in problem
- Need to find **distance** to the next greater element
- Classic "days until" pattern

**Key difference from Next Greater Element:**
- NGE returns the **value** of the next greater element
- This problem returns the **distance** (number of days to wait)
- Still uses the same monotonic stack pattern!

**Pattern signature:**
```
"For each element, find how far away the next greater element is"
→ Monotonic Stack storing INDICES, answer = current_idx - popped_idx
```

</details>

---

## ✅ When to Use This Approach

- Finding distance to next greater/smaller element
- "Days until" type problems
- When you need index difference, not the value itself

---

## ❌ When NOT to Use

| Situation | Why Not | Use Instead |
|-----------|---------|-------------|
| Need the actual warmer temp | Different output | Next Greater Element |
| Average temperature in window | Different problem | Sliding Window |
| Find ALL warmer days | Too many results | Different approach |

---

## 🔗 Concept Map

<details>
<summary><strong>Prerequisites & Next Steps</strong></summary>

**Before this, you should know:**
- [Next Greater Element I](./01-Next-Greater-Element-I.md) - Foundation
- [Monotonic Stack Concept](../3.1-Monotonic-Stack-Concept.md)

**After mastering this:**
- [Stock Span](./04-Stock-Span.md) - Similar distance calculation
- [Largest Rectangle in Histogram](../3.3-Histogram-Problems/01-Largest-Rectangle.md)

**Key insight:** Store indices in stack, compute distance on pop.

</details>

---

## 📐 How It Works

### Strategy

Same as Next Greater Element, but:
1. Store **indices** in the stack (not values)
2. When popping, compute **distance** = current index - popped index
3. Initialize result with 0 (no warmer day = 0 days to wait)

### Visual Walkthrough

```
temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
               [0]  [1] [2] [3] [4] [5] [6] [7]

Stack stores indices, maintains decreasing temperatures

i=0: temp=73
     Stack: []
     Push 0
     Stack: [0]          (temps: 73)

i=1: temp=74
     74 > temps[0]=73 → pop 0, answer[0] = 1-0 = 1
     Stack empty, push 1
     Stack: [1]          (temps: 74)

i=2: temp=75
     75 > temps[1]=74 → pop 1, answer[1] = 2-1 = 1
     Stack empty, push 2
     Stack: [2]          (temps: 75)

i=3: temp=71
     71 < temps[2]=75 → don't pop
     Push 3
     Stack: [2, 3]       (temps: 75, 71)

i=4: temp=69
     69 < temps[3]=71 → don't pop
     Push 4
     Stack: [2, 3, 4]    (temps: 75, 71, 69)

i=5: temp=72
     72 > temps[4]=69 → pop 4, answer[4] = 5-4 = 1
     72 > temps[3]=71 → pop 3, answer[3] = 5-3 = 2
     72 < temps[2]=75 → don't pop
     Push 5
     Stack: [2, 5]       (temps: 75, 72)

i=6: temp=76
     76 > temps[5]=72 → pop 5, answer[5] = 6-5 = 1
     76 > temps[2]=75 → pop 2, answer[2] = 6-2 = 4
     Stack empty, push 6
     Stack: [6]          (temps: 76)

i=7: temp=73
     73 < temps[6]=76 → don't pop
     Push 7
     Stack: [6, 7]       (temps: 76, 73)

End: Indices 6, 7 remain → answer[6]=0, answer[7]=0

Result: [1, 1, 4, 2, 1, 1, 0, 0]
```

### Visual Diagram

```
Temperature Graph:
        76
        │     ○
   75   ○     │
   74   │○    │    73
   73   ○│    │    ○
   72   ││  ○ │    │
   71   ││  │○│    │
   69   ││  ││○    │
        ─────────────
Day:    0 1 2 3 4 5 6 7

Stack progression (showing temperatures, storing indices):
[73] → [74] → [75] → [75,71] → [75,71,69] → [75,72] → [76] → [76,73]

Answer computation:
Day 0: 1-0 = 1 (73→74)
Day 1: 2-1 = 1 (74→75)
Day 2: 6-2 = 4 (75→76)
Day 3: 5-3 = 2 (71→72)
Day 4: 5-4 = 1 (69→72)
Day 5: 6-5 = 1 (72→76)
Day 6: 0 (no warmer)
Day 7: 0 (no warmer)
```

---

## 💻 Code Implementation

### Solution: Monotonic Decreasing Stack

**Python:**
```python
def daily_temperatures(temperatures: list[int]) -> list[int]:
    """
    Find days until warmer temperature for each day.
    
    Pattern: Monotonic Decreasing Stack (stores indices)
    Time: O(n), Space: O(n)
    
    Key insight: Store indices to compute distance.
    """
    n = len(temperatures)
    answer = [0] * n  # Default: 0 days (no warmer temp)
    stack = []  # Store indices of days
    
    for i in range(n):
        # Current temp is warmer than stack top
        while stack and temperatures[i] > temperatures[stack[-1]]:
            prev_day = stack.pop()
            answer[prev_day] = i - prev_day  # Distance
        
        stack.append(i)
    
    return answer


def daily_temperatures_reverse(temperatures: list[int]) -> list[int]:
    """
    Alternative: Process right to left.
    Use a "hottest so far" optimization.
    """
    n = len(temperatures)
    answer = [0] * n
    hottest = 0  # Track hottest from the right
    
    for i in range(n - 1, -1, -1):
        current_temp = temperatures[i]
        
        # If current is hottest so far, no warmer day exists
        if current_temp >= hottest:
            hottest = current_temp
            # answer[i] already 0
        else:
            # Search for warmer day using previous answers
            days = 1
            while temperatures[i + days] <= current_temp:
                days += answer[i + days]
            answer[i] = days
    
    return answer
```

**JavaScript:**
```javascript
/**
 * Find days until warmer temperature.
 * Pattern: Monotonic Decreasing Stack
 * Time: O(n), Space: O(n)
 */
function dailyTemperatures(temperatures) {
    const n = temperatures.length;
    const answer = new Array(n).fill(0);
    const stack = []; // Store indices
    
    for (let i = 0; i < n; i++) {
        while (stack.length > 0 && 
               temperatures[i] > temperatures[stack[stack.length - 1]]) {
            const prevDay = stack.pop();
            answer[prevDay] = i - prevDay;
        }
        stack.push(i);
    }
    
    return answer;
}

// Alternative: Right to left with optimization
function dailyTemperaturesReverse(temperatures) {
    const n = temperatures.length;
    const answer = new Array(n).fill(0);
    let hottest = 0;
    
    for (let i = n - 1; i >= 0; i--) {
        const currentTemp = temperatures[i];
        
        if (currentTemp >= hottest) {
            hottest = currentTemp;
        } else {
            let days = 1;
            while (temperatures[i + days] <= currentTemp) {
                days += answer[i + days];
            }
            answer[i] = days;
        }
    }
    
    return answer;
}
```

---

## ⚡ Complexity Analysis

| Approach | Time | Space | Notes |
|----------|------|-------|-------|
| Monotonic Stack |" O(n) "|" O(n) "| Each element pushed/popped once |
| Right-to-Left Jump |" O(n) "|" O(1) "| Uses previous answers to jump |

**Stack Approach Analysis:**
- Each day is pushed exactly once: O(n)
- Each day is popped at most once: O(n)
- Total: O(n)

**Why the Jump Approach is O(n):**
- Even though there's a while loop inside
- The jumps use previously computed answers
- Each position is "visited" at most twice
- Amortized O(n)

---

## 🔄 Variations

| Variation | Difference | Problem |
|-----------|------------|---------|
| Days until colder | Use increasing stack | Reverse comparison |
| Stock Span | Count consecutive smaller | LC 901 |
| With circular array | Combine with NGE II | - |

---

## ⚠️ Common Mistakes

### 1. Returning Values Instead of Distances

```python
# ❌ WRONG: Returns the warmer temperature
answer[prev_day] = temperatures[i]  # Wrong!

# ✅ CORRECT: Returns the distance
answer[prev_day] = i - prev_day
```

### 2. Wrong Distance Calculation

```python
# ❌ WRONG: Subtracting wrong way
answer[prev_day] = prev_day - i  # Negative!

# ✅ CORRECT: Current index minus previous
answer[prev_day] = i - prev_day  # Always positive
```

### 3. Storing Values Instead of Indices

```python
# ❌ WRONG: Can't compute distance with values
stack.append(temperatures[i])
# Later: Can't find the original index!

# ✅ CORRECT: Store indices
stack.append(i)
# Later: answer[stack.pop()] = i - popped_index
```

### 4. Not Using Strictly Greater

```python
# ❌ WRONG: >= includes equal temperatures
while stack and temperatures[i] >= temperatures[stack[-1]]:

# ✅ CORRECT: Must be strictly warmer (>)
while stack and temperatures[i] > temperatures[stack[-1]]:
```

---

## 📝 Practice Problems (Progressive)

### This Problem
- [ ] [Daily Temperatures](https://leetcode.com/problems/daily-temperatures/) - LC 739 ⭐

### Related Problems
- [ ] [Online Stock Span](https://leetcode.com/problems/online-stock-span/) - LC 901
- [ ] [Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/) - LC 496
- [ ] [Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums/) - LC 907

<details>
<summary><strong>🧠 Spaced Repetition Schedule</strong></summary>

**Day 1:** Implement stack solution, trace through example
**Day 3:** Implement right-to-left solution
**Day 7:** Solve without looking at notes
**Day 14:** Compare with Stock Span problem
**Day 21:** Teach the difference between value vs distance output

</details>

---

## 🎤 Interview Context

<details>
<summary><strong>How to Communicate This in Interviews</strong></summary>

**Opening statement:**
> "This is a 'next greater element' problem where I need the distance instead of the value. I'll use a monotonic stack storing indices."

**Walk through approach:**
> "I maintain a stack of indices representing days with decreasing temperatures. When I find a warmer day, I pop all colder days and record the distance."

**Complexity explanation:**
> "Time is O(n) since each day is pushed and popped at most once. Space is O(n) for the stack in the worst case of decreasing temperatures."

**Edge cases to mention:**
- Single day: [72] → [0]
- All decreasing: [76, 75, 74] → [0, 0, 0]
- All increasing: [70, 71, 72] → [1, 1, 0]
- All same: [72, 72, 72] → [0, 0, 0] (not strictly greater)

</details>

**Company Focus:**

| Company | Frequency | Notes |
|---------|-----------|-------|
| Amazon | ⭐⭐⭐⭐⭐ | Very common |
| Meta | ⭐⭐⭐⭐ | Classic problem |
| Google | ⭐⭐⭐⭐ | May ask follow-ups |
| Microsoft | ⭐⭐⭐⭐ | Standard interview problem |
| Bloomberg | ⭐⭐⭐⭐⭐ | Weather/stock themed |

---

## ⏱️ Time Estimates

| Activity | Time | Notes |
|----------|------|-------|
| Understand problem | 2-3 min | Clear problem statement |
| Identify pattern | 1-2 min | "Next warmer" → Monotonic stack |
| Implement | 8-10 min | Store indices, compute distance |
| Test & debug | 3-5 min | Trace through examples |
| Interview target | 15-20 min | Including explanation |

---

> **💡 Key Insight:** The difference between "Next Greater Element" and "Daily Temperatures" is subtle but important: NGE returns the VALUE, while Daily Temperatures returns the DISTANCE. Both use the same stack pattern, but storing INDICES enables distance calculation.

---

## 🔗 Related

- [Monotonic Stack Concept](../3.1-Monotonic-Stack-Concept.md) - Pattern overview
- [Next Greater Element I](./01-Next-Greater-Element-I.md) - Returns value instead
- [Stock Span](./04-Stock-Span.md) - Counts consecutive days
- [Largest Rectangle](../3.3-Histogram-Problems/01-Largest-Rectangle.md) - Advanced application
