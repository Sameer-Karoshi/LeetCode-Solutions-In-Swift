class Solution {
    
    // ----------------------------------------------------------
    // 1️⃣ RECURSION (Exponential) — pick / not-pick
    // ----------------------------------------------------------
    func countWaysRecursion(_ idx: Int, _ target: Int, _ coins: [Int]) -> Int {
        // Base case: if we are at coin 0, only valid if target divisible by coins[0]
        if idx == 0 {
            return (target % coins[0] == 0) ? 1 : 0
        }
        
        // Not pick the coin
        let notPick = countWaysRecursion(idx - 1, target, coins)
        
        // Pick the coin (only if coin <= target)
        var pick = 0
        if coins[idx] <= target {
            pick = countWaysRecursion(idx, target - coins[idx], coins)
        }
        
        return pick + notPick
    }
    
    
    
    // ----------------------------------------------------------
    // 2️⃣ MEMOIZATION — Top-Down DP
    // dp[idx][target] = number of ways
    // ----------------------------------------------------------
    func countWaysMemo(_ idx: Int, _ target: Int, _ coins: [Int], _ dp: inout [[Int]]) -> Int {
        
        // Base case
        if idx == 0 {
            return (target % coins[0] == 0) ? 1 : 0
        }
        
        // Return memo
        if dp[idx][target] != -1 {
            return dp[idx][target]
        }
        
        // Not pick
        let notPick = countWaysMemo(idx - 1, target, coins, &dp)
        
        // Pick
        var pick = 0
        if coins[idx] <= target {
            pick = countWaysMemo(idx, target - coins[idx], coins, &dp)
        }
        
        dp[idx][target] = pick + notPick
        return dp[idx][target]
    }
    
    
    
    // ----------------------------------------------------------
    // 3️⃣ TABULATION — Bottom-Up DP
    // ----------------------------------------------------------
    func countWaysTabulation(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        var dp = Array(repeating: Array(repeating: 0, count: amount + 1), count: n)
        
        // Base case: first row (using coin 0)
        for t in 0...amount {
            if t % coins[0] == 0 {
                dp[0][t] = 1
            }
        }
        
        for i in 1..<n {
            for t in 0...amount {
                
                // Not pick
                var notPick = dp[i - 1][t]
                
                // Pick
                var pick = 0
                if coins[i] <= t {
                    pick = dp[i][t - coins[i]]
                }
                
                dp[i][t] = pick + notPick
            }
        }
        
        return dp[n - 1][amount]
    }
    
    
    
    // ----------------------------------------------------------
    // 4️⃣ SPACE OPTIMIZED (1D DP) — Best Approach
    // ----------------------------------------------------------
    func countWaysSpaceOpt(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        
        // Base case for first coin
        for t in 0...amount {
            if t % coins[0] == 0 {
                dp[t] = 1
            }
        }
        
        // Iterate over remaining coins
        for i in 1..<coins.count {
            for t in 0...amount {
                if coins[i] <= t {
                    dp[t] += dp[t - coins[i]]
                }
            }
        }
        
        return dp[amount]
    }
    
    
    
    // ----------------------------------------------------------
    // 📌 MAIN FUNCTION (LeetCode API)
    // Uses space optimized version
    // ----------------------------------------------------------
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        return countWaysSpaceOpt(amount, coins)
    }
}
