class Solution {
    
    // ===========================================================
    // 1️⃣ RECURSION (Brute Force)
    // take / notTake format
    // ===========================================================
    func countSubsetsRecursion(_ arr: [Int], _ idx: Int, _ target: Int) -> Int {
        
        if idx == 0 {
            if target == 0 { return 1 }
            return arr[0] == target ? 1 : 0
        }
        
        // ---------------------------
        // notTake: do NOT include arr[idx]
        // ---------------------------
        let notTake = countSubsetsRecursion(arr, idx - 1, target)
        
        // ---------------------------
        // take: include arr[idx]
        // ---------------------------
        var take = 0
        if arr[idx] <= target {
            take = countSubsetsRecursion(arr, idx - 1, target - arr[idx])
        }
        
        return take + notTake
    }
    
    
    
    // ===========================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // take / notTake format
    // ===========================================================
    func countSubsetsMemo(_ arr: [Int], _ idx: Int, _ target: Int,
                          _ dp: inout [[Int]]) -> Int {
        
        if idx == 0 {
            if target == 0 { return 1 }
            return arr[0] == target ? 1 : 0
        }
        
        if dp[idx][target] != -1 {
            return dp[idx][target]
        }
        
        // ---------------------------
        // notTake
        // ---------------------------
        let notTake = countSubsetsMemo(arr, idx - 1, target, &dp)
        
        // ---------------------------
        // take
        // ---------------------------
        var take = 0
        if arr[idx] <= target {
            take = countSubsetsMemo(arr, idx - 1, target - arr[idx], &dp)
        }
        
        dp[idx][target] = take + notTake
        return dp[idx][target]
    }
    
    
    
    // ===========================================================
    // 3️⃣ TABULATION (Bottom-Up DP)
    // take / notTake format
    // ===========================================================
    func countSubsetsTab(_ arr: [Int], _ target: Int) -> Int {
        let n = arr.count
        
        var dp = Array(repeating: Array(repeating: 0, count: target + 1), count: n)
        
        // Base: empty subset sums to 0
        for i in 0..<n {
            dp[i][0] = 1
        }
        
        // First element
        if arr[0] <= target {
            dp[0][arr[0]] = 1
        }
        
        for i in 1..<n {
            for t in 0...target {
                
                // ---------------------------
                // notTake
                // ---------------------------
                let notTake = dp[i - 1][t]
                
                // ---------------------------
                // take
                // ---------------------------
                var take = 0
                if arr[i] <= t {
                    take = dp[i - 1][t - arr[i]]
                }
                
                dp[i][t] = take + notTake
            }
        }
        
        return dp[n - 1][target]
    }
    
    
    
    // ===========================================================
    // 4️⃣ SPACE OPTIMIZED DP (1D DP)
    // take / notTake format
    // ===========================================================
    func countSubsetsSpaceOpt(_ arr: [Int], _ target: Int) -> Int {
        
        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1
        
        if arr[0] <= target {
            dp[arr[0]] += 1
        }
        
        for i in 1..<arr.count {
            var curr = dp
            for t in 0...target {
                
                // notTake = dp[t]
                let notTake = dp[t]
                
                // take = dp[t - arr[i]] if possible
                var take = 0
                if arr[i] <= t {
                    take = dp[t - arr[i]]
                }
                
                curr[t] = take + notTake
            }
            dp = curr
        }
        
        return dp[target]
    }
}
