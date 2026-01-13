class BuyAndSellStockWithFee {

    // MARK: - 1️⃣ Recursion (TLE)
    func recursion(_ prices: [Int], _ fee: Int) -> Int {
        return solveRecursion(0, 1, prices, fee)
    }

    private func solveRecursion(_ ind: Int, _ buy: Int,
                                _ prices: [Int], _ fee: Int) -> Int {

        // Base case: no more days left
        if ind == prices.count {
            return 0
        }

        var profit = 0

        if buy == 1 {
            // Option 1: Buy stock
            let take = -prices[ind] + solveRecursion(ind + 1, 0, prices, fee)
            // Option 2: Skip buying
            let notTake = solveRecursion(ind + 1, 1, prices, fee)
            profit = max(take, notTake)
        } else {
            // Option 1: Sell stock (pay fee)
            let sell = prices[ind] - fee + solveRecursion(ind + 1, 1, prices, fee)
            // Option 2: Skip selling
            let notSell = solveRecursion(ind + 1, 0, prices, fee)
            profit = max(sell, notSell)
        }

        return profit
    }

    // MARK: - 2️⃣ Memoization (DP)
    func memoization(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: -1, count: 2), count: n)
        return solveMemo(0, 1, prices, fee, &dp)
    }

    private func solveMemo(_ ind: Int, _ buy: Int,
                           _ prices: [Int], _ fee: Int,
                           _ dp: inout [[Int]]) -> Int {

        if ind == prices.count {
            return 0
        }

        if dp[ind][buy] != -1 {
            return dp[ind][buy]
        }

        var profit = 0

        if buy == 1 {
            let take = -prices[ind] + solveMemo(ind + 1, 0, prices, fee, &dp)
            let notTake = solveMemo(ind + 1, 1, prices, fee, &dp)
            profit = max(take, notTake)
        } else {
            let sell = prices[ind] - fee + solveMemo(ind + 1, 1, prices, fee, &dp)
            let notSell = solveMemo(ind + 1, 0, prices, fee, &dp)
            profit = max(sell, notSell)
        }

        dp[ind][buy] = profit
        return profit
    }

    // MARK: - 3️⃣ Tabulation (Bottom-Up DP)
    func tabulation(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: n + 1)

        for ind in stride(from: n - 1, through: 0, by: -1) {
            for buy in 0...1 {
                if buy == 1 {
                    dp[ind][buy] = max(
                        -prices[ind] + dp[ind + 1][0],
                        dp[ind + 1][1]
                    )
                } else {
                    dp[ind][buy] = max(
                        prices[ind] - fee + dp[ind + 1][1],
                        dp[ind + 1][0]
                    )
                }
            }
        }

        return dp[0][1]
    }

    // MARK: - 4️⃣ Space Optimization
    func spaceOptimization(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var ahead = [0, 0]  // dp[ind+1]
        var curr = [0, 0]   // dp[ind]

        for ind in stride(from: n - 1, through: 0, by: -1) {
            // buy = 1
            curr[1] = max(
                -prices[ind] + ahead[0],
                ahead[1]
            )

            // buy = 0
            curr[0] = max(
                prices[ind] - fee + ahead[1],
                ahead[0]
            )

            ahead = curr
        }

        return ahead[1]
    }
}
