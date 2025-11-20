class Solution {
    
    // ===========================================================
    // 1️⃣ RECURSION (Brute Force)
    // Time:  O(2^n)
    // Space: O(n) recursion stack
    // ===========================================================
    func subsetSumRecursion(_ arr: [Int], _ idx: Int, _ target: Int) -> Bool {
        // Base case: target reached
        if target == 0 { return true }
        // Base case: only first element to check
        if idx == 0 { return arr[0] == target }
        
        // Option 1: not taking current element
        let notTake = subsetSumRecursion(arr, idx - 1, target)
        
        // Option 2: taking current element (if feasible)
        var take = false
        if arr[idx] <= target {
            take = subsetSumRecursion(arr, idx - 1, target - arr[idx])
        }
        
        return take || notTake
    }
    
    
    // ===========================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // Time:  O(n × target)
    // Space: O(n × target) + O(n) recursion stack
    // ===========================================================
    func subsetSumMemo(_ arr: [Int], _ idx: Int, _ target: Int, _ dp: inout [[Int]]) -> Bool {
        if target == 0 { return true }
        if idx == 0 { return arr[0] == target }
        
        if dp[idx][target] != -1 {
            return dp[idx][target] == 1
        }
        
        let notTake = subsetSumMemo(arr, idx - 1, target, &dp)
        var take = false
        if arr[idx] <= target {
            take = subsetSumMemo(arr, idx - 1, target - arr[idx], &dp)
        }
        
        let result = take || notTake
        dp[idx][target] = result ? 1 : 0
        return result
    }
    
    
    // ===========================================================
    // 3️⃣ TABULATION (Bottom-Up DP)
    // Time:  O(n × target)
    // Space: O(n × target)
    // ===========================================================
    func subsetSumTab(_ arr: [Int], _ target: Int) -> Bool {
        let n = arr.count
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: n)
        
        // Sum 0 is always achievable
        for i in 0..<n { dp[i][0] = true }
        
        // First element base case
        if arr[0] <= target {
            dp[0][arr[0]] = true
        }
        
        // Fill the DP table
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
        
        return dp[n - 1][target]
    }
    
    
    // ===========================================================
    // 4️⃣ SPACE OPTIMIZED DP (1D DP)
    // Time:  O(n × target)
    // Space: O(target)
    // ===========================================================
    func subsetSumSpaceOpt(_ arr: [Int], _ target: Int) -> Bool {
        let n = arr.count
        var prev = Array(repeating: false, count: target + 1)
        prev[0] = true
        
        if arr[0] <= target {
            prev[arr[0]] = true
        }
        
        for i in 1..<n {
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
        
        return prev[target]
    }
}
