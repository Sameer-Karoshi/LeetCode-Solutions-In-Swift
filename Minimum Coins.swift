class Solution {

    // ============================================================
    // PUBLIC FUNCTION → choose any method
    // ============================================================
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        let n = coins.count

        // 1️⃣ Recursion (Exponential)
        // let ans = recursion(coins, n - 1, amount)
        // return ans == Int.max ? -1 : ans

        // 2️⃣ Memoization (Top-Down DP)
        // var dp = Array(repeating: Array(repeating: -1, count: amount + 1), count: n)
        // let ans = memo(coins, n - 1, amount, &dp)
        // return ans == Int.max ? -1 : ans

        // 3️⃣ Tabulation (Bottom-Up DP)
        // let ans = tab(coins, amount)
        // return ans == Int.max ? -1 : ans

        // 4️⃣ Space Optimized using prev and curr
        let ans = spaceOptimized(coins, amount)
        return ans == Int.max ? -1 : ans
    }

    // ============================================================
    // 4️⃣ SPACE OPTIMIZED (prev & curr)
    // ============================================================
    func spaceOptimized(_ coins: [Int], _ amount: Int) -> Int {

        let n = coins.count
        var prev = Array(repeating: Int.max, count: amount + 1)

        // Base case: only coin[0]
        for t in 0...amount {
            if t % coins[0] == 0 {
                prev[t] = t / coins[0]
            }
        }

        // Process remaining coins
        for i in 1..<n {
            var curr = Array(repeating: Int.max, count: amount + 1)
            for t in 0...amount {
                // Option 1: Do not take coin[i]
                let notTake = prev[t]

                // Option 2: Take coin[i] (if possible)
                var take = Int.max
                if coins[i] <= t, curr[t - coins[i]] != Int.max {
                    take = 1 + curr[t - coins[i]]
                }

                curr[t] = min(take, notTake)
            }
            prev = curr
        }

        return prev[amount]
    }

    // ============================================================
    // 1️⃣ PURE RECURSION
    // ============================================================
    func recursion(_ coins: [Int], _ index: Int, _ amount: Int) -> Int {

        if index == 0 {
            if amount % coins[0] == 0 {
                return amount / coins[0]
            } else {
                return Int.max
            }
        }

        let notTake = recursion(coins, index - 1, amount)

        var take = Int.max
        if coins[index] <= amount {
            let res = recursion(coins, index, amount - coins[index])
            if res != Int.max {
                take = 1 + res
            }
        }

        return min(take, notTake)
    }

    // ============================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // ============================================================
    func memo(_ coins: [Int], _ index: Int, _ amount: Int,
              _ dp: inout [[Int]]) -> Int {

        if index == 0 {
            if amount % coins[0] == 0 {
                return amount / coins[0]
            } else {
                return Int.max
            }
        }

        if dp[index][amount] != -1 {
            return dp[index][amount]
        }

        let notTake = memo(coins, index - 1, amount, &dp)

        var take = Int.max
        if coins[index] <= amount {
            let res = memo(coins, index, amount - coins[index], &dp)
            if res != Int.max {
                take = 1 + res
            }
        }

        dp[index][amount] = min(take, notTake)
        return dp[index][amount]
    }

    // ============================================================
    // 3️⃣ TABULATION (Bottom-Up DP)
    // ============================================================
    func tab(_ coins: [Int], _ amount: Int) -> Int {

        let n = coins.count
        var dp = Array(repeating: Array(repeating: Int.max, count: amount + 1), count: n)

        // Base case: only coin[0]
        for t in 0...amount {
            if t % coins[0] == 0 {
                dp[0][t] = t / coins[0]
            }
        }

        for i in 1..<n {
            for t in 0...amount {
                let notTake = dp[i - 1][t]

                var take = Int.max
                if coins[i] <= t, dp[i][t - coins[i]] != Int.max {
                    take = 1 + dp[i][t - coins[i]]
                }

                dp[i][t] = min(take, notTake)
            }
        }

        return dp[n - 1][amount]
    }
}
