class Solution {
    
    // ===========================================================
    // Helper: SPACE OPTIMIZED subset-sum
    // Returns the entire DP boolean array (reachable sums)
    // ===========================================================
    func subsetSumSpaceOptAll(_ arr: [Int], _ target: Int) -> [Bool] {
        var prev = Array(repeating: false, count: target + 1)
        prev[0] = true
        
        if arr[0] <= target {
            prev[arr[0]] = true
        }
        
        for i in 1..<arr.count {
            var curr = prev
            for t in 1...target {
                let notTake = prev[t]
                var take = false
                if arr[i] <= t {
                    take = prev[t - arr[i]]
                }
                curr[t] = take || notTake
            }
            prev = curr
        }
        
        return prev
    }
    
    
    // ===========================================================
    // 1️⃣ RECURSION (Brute Force)
    // Time:  O(2^n)
    // Space: O(n)
    // ===========================================================
    func minSubsetDiffRecursion(_ arr: [Int], _ idx: Int, _ currSum: Int, _ total: Int) -> Int {
        if idx == 0 {
            let s1 = currSum + arr[0]
            let s2 = total - s1
            return abs(s1 - s2)
        }
        
        // Take
        let take = minSubsetDiffRecursion(arr, idx - 1, currSum + arr[idx], total)
        
        // Not Take
        let notTake = minSubsetDiffRecursion(arr, idx - 1, currSum, total)
        
        return min(take, notTake)
    }
    
    
    // ===========================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // Time:  O(n × sum)
    // Space: O(n × sum) + O(n)
    // dp[idx][currSum] = minimum difference from this state
    // ===========================================================
    func minSubsetDiffMemo(_ arr: [Int], _ idx: Int, _ currSum: Int, _ total: Int,
                           _ dp: inout [[Int]]) -> Int {
        
        if idx == 0 {
            let s1 = currSum + arr[0]
            let s2 = total - s1
            return abs(s1 - s2)
        }
        
        if dp[idx][currSum] != -1 {
            return dp[idx][currSum]
        }
        
        let take = minSubsetDiffMemo(arr, idx - 1, currSum + arr[idx], total, &dp)
        let notTake = minSubsetDiffMemo(arr, idx - 1, currSum, total, &dp)
        
        dp[idx][currSum] = min(take, notTake)
        return dp[idx][currSum]
    }
    
    
    // ===========================================================
    // 3️⃣ TABULATION (Using subset-sum DP table)
    // Time:  O(n × sum)
    // Space: O(n × sum)
    // ===========================================================
    func minSubsetDiffTab(_ arr: [Int]) -> Int {
        let n = arr.count
        let total = arr.reduce(0, +)
        let target = total / 2
        
        // subset sum table
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: n)
        
        for i in 0..<n { dp[i][0] = true }
        if arr[0] <= target {
            dp[0][arr[0]] = true
        }
        
        for i in 1..<n {
            for t in 1...target {
                let notTake = dp[i - 1][t]
                var take = false
                if arr[i] <= t {
                    take = dp[i - 1][t - arr[i]]
                }
                dp[i][t] = take || notTake
            }
        }
        
        // compute minimum difference
        var minDiff = Int.max
        for s1 in 0...target {
            if dp[n - 1][s1] {
                let s2 = total - s1
                minDiff = min(minDiff, abs(s1 - s2))
            }
        }
        
        return minDiff
    }
    
    
    // ===========================================================
    // 4️⃣ SPACE OPTIMIZED DP (1D DP)
    // Time:  O(n × sum)
    // Space: O(sum)
    // ===========================================================
    func minSubsetDiffSpaceOpt(_ arr: [Int]) -> Int {
        let total = arr.reduce(0, +)
        let target = total / 2
        
        let possible = subsetSumSpaceOptAll(arr, target)
        
        var minDiff = Int.max
        for s1 in 0...target {
            if possible[s1] {
                let s2 = total - s1
                minDiff = min(minDiff, abs(s1 - s2))
            }
        }
        
        return minDiff
    }
}
