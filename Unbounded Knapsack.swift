import Foundation

class UnboundedKnapsack {
    
    // ------------------------------------------------------------
    // 1️⃣ RECURSION (VERY SLOW: O(2^N))
    // ------------------------------------------------------------
    func unboundedKnapsackRecursive(_ n: Int, _ w: Int, _ weight: [Int], _ value: [Int]) -> Int {
        func solve(_ index: Int, _ remaining: Int) -> Int {
            // Base Case: only one item left
            if index == 0 {
                return (remaining / weight[0]) * value[0]  // we can take unlimited of item[0]
            }
            
            // Option 1: NOT take the item
            let notTake = solve(index - 1, remaining)
            
            // Option 2: TAKE item (because unlimited)
            var take = Int.min
            if weight[index] <= remaining {
                take = value[index] + solve(index, remaining - weight[index])
            }
            
            return max(take, notTake)
        }
        
        return solve(n - 1, w)
    }
    
    
    // ------------------------------------------------------------
    // 2️⃣ MEMOIZATION (TOP-DOWN DP)
    // Time: O(N * W), Space: O(N * W)
    // ------------------------------------------------------------
    func unboundedKnapsackMemo(_ n: Int, _ w: Int, _ weight: [Int], _ value: [Int]) -> Int {
        
        var dp = Array(repeating: Array(repeating: -1, count: w + 1), count: n)
        
        func solve(_ index: Int, _ remaining: Int) -> Int {
            
            if index == 0 {
                return (remaining / weight[0]) * value[0]
            }
            
            if dp[index][remaining] != -1 {
                return dp[index][remaining]
            }
            
            let notTake = solve(index - 1, remaining)
            
            var take = Int.min
            if weight[index] <= remaining {
                take = value[index] + solve(index, remaining - weight[index])
            }
            
            dp[index][remaining] = max(take, notTake)
            return dp[index][remaining]
        }
        
        return solve(n - 1, w)
    }
    
    
    // ------------------------------------------------------------
    // 3️⃣ TABULATION (BOTTOM-UP DP)
    // Time: O(N * W), Space: O(N * W)
    // ------------------------------------------------------------
    func unboundedKnapsackTabulation(_ n: Int, _ w: Int, _ weight: [Int], _ value: [Int]) -> Int {
        
        var dp = Array(repeating: Array(repeating: 0, count: w + 1), count: n)
        
        // Base Case: for index 0, we take as many of item 0 as possible
        for cap in 0...w {
            dp[0][cap] = (cap / weight[0]) * value[0]
        }
        
        for i in 1..<n {
            for cap in 0...w {
                
                let notTake = dp[i - 1][cap]
                
                var take = Int.min
                if weight[i] <= cap {
                    take = value[i] + dp[i][cap - weight[i]]
                }
                
                dp[i][cap] = max(take, notTake)
            }
        }
        
        return dp[n - 1][w]
    }
    
    
    // ------------------------------------------------------------
    // 4️⃣ SPACE OPTIMIZATION (1D DP)
    // Best Approach — Time: O(N * W), Space: O(W)
    // ------------------------------------------------------------
    func unboundedKnapsackSpaceOptimized(_ n: Int, _ w: Int, _ weight: [Int], _ value: [Int]) -> Int {
        
        var dp = Array(repeating: 0, count: w + 1)
        
        // Base Case for item 0
        for cap in 0...w {
            dp[cap] = (cap / weight[0]) * value[0]
        }
        
        for i in 1..<n {
            for cap in 0...w {
                if weight[i] <= cap {
                    dp[cap] = max(dp[cap], value[i] + dp[cap - weight[i]])
                }
            }
        }
        
        return dp[w]
    }
}
