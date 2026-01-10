class BuyAndSellStockIII_TransactionNumber {

    // MARK: - 1️⃣ Recursive Solution
    // Time: O(2^N), Space: O(N)
    func maxProfitRecursive(_ prices: [Int]) -> Int {
        return solveRec(0, 0, prices)
    }

    private func solveRec(_ index: Int, _ trans: Int, _ prices: [Int]) -> Int {
        // Base cases
        if index == prices.count || trans == 4 {
            return 0
        }

        // Even transaction → Buy
        if trans % 2 == 0 {
            let buy = -prices[index] + solveRec(index + 1, trans + 1, prices)
            let skip = solveRec(index + 1, trans, prices)
            return max(buy, skip)
        }
        // Odd transaction → Sell
        else {
            let sell = prices[index] + solveRec(index + 1, trans + 1, prices)
            let skip = solveRec(index + 1, trans, prices)
            return max(sell, skip)
        }
    }

    // MARK: - 2️⃣ Memoization (Top-Down DP)
    // Time: O(N * 4), Space: O(N * 4)
    func maxProfitMemo(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: -1, count: 4), count: n)
        return solveMemo(0, 0, prices, &dp)
    }

    private func solveMemo(
        _ index: Int,
        _ trans: Int,
        _ prices: [Int],
        _ dp: inout [[Int]]
    ) -> Int {

        if index == prices.count || trans == 4 {
            return 0
        }

        if dp[index][trans] != -1 {
            return dp[index][trans]
        }

        var profit = 0

        if trans % 2 == 0 {
            let buy = -prices[index] + solveMemo(index + 1, trans + 1, prices, &dp)
            let skip = solveMemo(index + 1, trans, prices, &dp)
            profit = max(buy, skip)
        } else {
            let sell = prices[index] + solveMemo(index + 1, trans + 1, prices, &dp)
            let skip = solveMemo(index + 1, trans, prices, &dp)
            profit = max(sell, skip)
        }

        dp[index][trans] = profit
        return profit
    }

    // MARK: - 3️⃣ Tabulation (Bottom-Up DP)
    // Time: O(N * 4), Space: O(N * 4)
    func maxProfitTabulation(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n + 1)

        for index in stride(from: n - 1, through: 0, by: -1) {
            for trans in stride(from: 3, through: 0, by: -1) {
                if trans % 2 == 0 {
                    dp[index][trans] = max(
                        -prices[index] + dp[index + 1][trans + 1],
                        dp[index + 1][trans]
                    )
                } else {
                    dp[index][trans] = max(
                        prices[index] + dp[index + 1][trans + 1],
                        dp[index + 1][trans]
                    )
                }
            }
        }
        return dp[0][0]
    }

    // MARK: - 4️⃣ Space Optimized DP
    // Time: O(N * 4), Space: O(4)
    func maxProfitSpaceOptimized(_ prices: [Int]) -> Int {
        var ahead = Array(repeating: 0, count: 5)
        var curr = ahead

        for index in stride(from: prices.count - 1, through: 0, by: -1) {
            for trans in stride(from: 3, through: 0, by: -1) {
                if trans % 2 == 0 {
                    curr[trans] = max(
                        -prices[index] + ahead[trans + 1],
                        ahead[trans]
                    )
                } else {
                    curr[trans] = max(
                        prices[index] + ahead[trans + 1],
                        ahead[trans]
                    )
                }
            }
            ahead = curr
        }
        return ahead[0]
    }
}
