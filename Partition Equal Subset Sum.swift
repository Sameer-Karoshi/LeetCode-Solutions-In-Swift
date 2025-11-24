class Solution {
    
    // Function to check if array can be partitioned into 2 equal subsets
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
        
        // If sum is odd → cannot partition
        if totalSum % 2 != 0 { return false }
        
        let target = totalSum / 2
        return subsetSumSpaceOpt(nums, target)  // Use any method here
    }
    
    
    // ===========================================================
    // 1️⃣ RECURSION
    // ===========================================================
    func subsetSumRecursion(_ arr: [Int], _ idx: Int, _ target: Int) -> Bool {
        if target == 0 { return true }
        if idx == 0 { return arr[0] == target }
        
        let notTake = subsetSumRecursion(arr, idx - 1, target)
        
        var take = false
        if arr[idx] <= target {
            take = subsetSumRecursion(arr, idx - 1, target - arr[idx])
        }
        
        return take || notTake
    }
    
    
    // ===========================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
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
    
    
    // Helper for memoized canPartition
    func canPartitionMemo(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
        if totalSum % 2 != 0 { return false }
        
        let target = totalSum / 2
        var dp = Array(repeating: Array(repeating: -1, count: target + 1), count: nums.count)
        
        return subsetSumMemo(nums, nums.count - 1, target, &dp)
    }
    
    
    // ===========================================================
    // 3️⃣ TABULATION (Bottom-Up)
    // ===========================================================
    func subsetSumTab(_ arr: [Int], _ target: Int) -> Bool {
        let n = arr.count
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
        
        return dp[n - 1][target]
    }
    
    
    // ===========================================================
    // 4️⃣ SPACE OPTIMIZED (1D DP)
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
