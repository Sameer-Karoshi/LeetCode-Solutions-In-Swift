class Solution {

    // MARK: - 1. Recursion (Brute Force)
    // Time: O(2^n)
    // Space: O(n) - recursion stack
    func recursion(_ prices: [Int]) -> Int {

        func solve(_ index: Int, _ canBuy: Bool) -> Int {
            // Base case: no more days
            if index >= prices.count {
                return 0
            }

            if canBuy {
                // Buy today or skip
                let buy = -prices[index] + solve(index + 1, false)
                let skip = solve(index + 1, true)
                return max(buy, skip)
            } else {
                // Sell today (cooldown tomorrow) or skip
                let sell = prices[index] + solve(index + 2, true)
                let skip = solve(index + 1, false)
                return max(sell, skip)
            }
        }

        return solve(0, true)
    }

    // MARK: - 2. Memoization (Top-Down DP)
    // Time: O(n)
    // Space: O(n)
    func memoization(_ prices: [Int]) -> Int {
        let n = prices.count

        // dp[index][canBuy]
        var dp = Array(repeating: Array(repeating: -1, count: 2), count: n)

        func solve(_ index: Int, _ canBuy: Int) -> Int {
            if index >= n {
                return 0
            }

            if dp[index][canBuy] != -1 {
                return dp[index][canBuy]
            }

            var profit = 0

            if canBuy == 1 {
                let buy = -prices[index] + solve(index + 1, 0)
                let skip = solve(index + 1, 1)
                profit = max(buy, skip)
            } else {
                let sell = prices[index] + solve(index + 2, 1)
                let skip = solve(index + 1, 0)
                profit = max(sell, skip)
            }

            dp[index][canBuy] = profit
            return profit
        }

        return solve(0, 1)
    }

    // MARK: - 3. Tabulation (Bottom-Up DP)
    // Time: O(n)
    // Space: O(n)
    func tabulation(_ prices: [Int]) -> Int {
        let n = prices.count

        // dp[index][canBuy]
        // Extra 2 rows to avoid index out of bounds for cooldown
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: n + 2)

        for index in stride(from: n - 1, through: 0, by: -1) {

            // When we can buy
            dp[index][1] = max(
                -prices[index] + dp[index + 1][0], // buy
                dp[index + 1][1]                   // skip
            )

            // When we must sell
            dp[index][0] = max(
                prices[index] + dp[index + 2][1], // sell + cooldown
                dp[index + 1][0]                   // skip
            )
        }

        return dp[0][1]
    }

    // MARK: - 4. Space Optimization
    // Time: O(n)
    // Space: O(1)
    func spaceOptimization(_ prices: [Int]) -> Int {

        var nextBuy = 0      // dp[index + 1][1]
        var nextSell = 0     // dp[index + 1][0]
        var next2Buy = 0     // dp[index + 2][1]

        for index in stride(from: prices.count - 1, through: 0, by: -1) {

            // Current day calculations
            let currBuy = max(
                -prices[index] + nextSell,
                nextBuy
            )

            let currSell = max(
                prices[index] + next2Buy,
                nextSell
            )

            // Shift states
            next2Buy = nextBuy
            nextBuy = currBuy
            nextSell = currSell
        }

        return nextBuy
    }
}
