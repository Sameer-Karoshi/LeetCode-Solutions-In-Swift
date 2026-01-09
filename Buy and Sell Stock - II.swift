class BuyAndSellStockII {

    // =========================================================
    // 1️⃣ RECURSION (Exponential Time)
    // =========================================================
    func maxProfitRecursion(_ prices: [Int]) -> Int {
        return solveRec(0, 1, prices)
    }

    private func solveRec(_ index: Int, _ buy: Int, _ prices: [Int]) -> Int {
        // Base case: reached end
        if index == prices.count {
            return 0
        }

        var profit = 0

        if buy == 1 {
            // Option 1: Buy
            let buyStock = -prices[index] + solveRec(index + 1, 0, prices)
            // Option 2: Skip
            let skip = solveRec(index + 1, 1, prices)
            profit = max(buyStock, skip)
        } else {
            // Option 1: Sell
            let sellStock = prices[index] + solveRec(index + 1, 1, prices)
            // Option 2: Skip
            let skip = solveRec(index + 1, 0, prices)
            profit = max(sellStock, skip)
        }

        return profit
    }

    // =========================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // =========================================================
    func maxProfitMemo(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: -1, count: 2), count: n)
        return solveMemo(0, 1, prices, &dp)
    }

    private func solveMemo(
        _ index: Int,
        _ buy: Int,
        _ prices: [Int],
        _ dp: inout [[Int]]
    ) -> Int {

        if index == prices.count {
            return 0
        }

        if dp[index][buy] != -1 {
            return dp[index][buy]
        }

        var profit = 0

        if buy == 1 {
            let buyStock = -prices[index] + solveMemo(index + 1, 0, prices, &dp)
            let skip = solveMemo(index + 1, 1, prices, &dp)
            profit = max(buyStock, skip)
        } else {
            let sellStock = prices[index] + solveMemo(index + 1, 1, prices, &dp)
            let skip = solveMemo(index + 1, 0, prices, &dp)
            profit = max(sellStock, skip)
        }

        dp[index][buy] = profit
        return profit
    }

    // =========================================================
    // 3️⃣ TABULATION (Bottom-Up DP)
    // =========================================================
    func maxProfitTabulation(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: n + 1)

        for index in stride(from: n - 1, through: 0, by: -1) {
            for buy in 0...1 {
                if buy == 1 {
                    dp[index][buy] = max(
                        -prices[index] + dp[index + 1][0],
                        dp[index + 1][1]
                    )
                } else {
                    dp[index][buy] = max(
                        prices[index] + dp[index + 1][1],
                        dp[index + 1][0]
                    )
                }
            }
        }

        return dp[0][1]
    }

    // =========================================================
    // 4️⃣ SPACE OPTIMIZATION (Best)
    // =========================================================
    func maxProfitSpaceOptimized(_ prices: [Int]) -> Int {
        let n = prices.count
        var ahead = [0, 0]
        var curr = [0, 0]

        for index in stride(from: n - 1, through: 0, by: -1) {
            // buy = 1
            curr[1] = max(
                -prices[index] + ahead[0],
                ahead[1]
            )

            // buy = 0
            curr[0] = max(
                prices[index] + ahead[1],
                ahead[0]
            )

            ahead = curr
        }

        return ahead[1]
    }
}
