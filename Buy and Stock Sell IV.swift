class Solution {

    // 1️⃣ RECURSION (Brute Force)
    func recursion(_ k: Int, _ prices: [Int]) -> Int {
        return recursionHelper(0, 0, k, prices)
    }

    private func recursionHelper(
        _ day: Int,
        _ transNumber: Int,
        _ k: Int,
        _ prices: [Int]
    ) -> Int {

        // Base case
        if day == prices.count || transNumber == 2 * k {
            return 0
        }

        // Even transaction number → BUY
        if transNumber % 2 == 0 {
            return max(
                -prices[day] + recursionHelper(day + 1, transNumber + 1, k, prices),
                recursionHelper(day + 1, transNumber, k, prices)
            )
        }
        // Odd transaction number → SELL
        else {
            return max(
                prices[day] + recursionHelper(day + 1, transNumber + 1, k, prices),
                recursionHelper(day + 1, transNumber, k, prices)
            )
        }
    }

    // 2️⃣ MEMOIZATION (Top-Down DP)
    func memoization(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(
            repeating: Array(repeating: -1, count: 2 * k),
            count: n
        )
        return memoHelper(0, 0, k, prices, &dp)
    }

    private func memoHelper(
        _ day: Int,
        _ transNumber: Int,
        _ k: Int,
        _ prices: [Int],
        _ dp: inout [[Int]]
    ) -> Int {

        if day == prices.count || transNumber == 2 * k {
            return 0
        }

        if dp[day][transNumber] != -1 {
            return dp[day][transNumber]
        }

        let profit: Int

        if transNumber % 2 == 0 {
            profit = max(
                -prices[day] + memoHelper(day + 1, transNumber + 1, k, prices, &dp),
                memoHelper(day + 1, transNumber, k, prices, &dp)
            )
        } else {
            profit = max(
                prices[day] + memoHelper(day + 1, transNumber + 1, k, prices, &dp),
                memoHelper(day + 1, transNumber, k, prices, &dp)
            )
        }

        dp[day][transNumber] = profit
        return profit
    }

    // 3️⃣ TABULATION (Bottom-Up DP)
    func tabulation(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        let maxTransNumber = 2 * k

        var dp = Array(
            repeating: Array(repeating: 0, count: maxTransNumber + 1),
            count: n + 1
        )

        for day in stride(from: n - 1, through: 0, by: -1) {
            for transNumber in 0..<maxTransNumber {

                if transNumber % 2 == 0 {
                    dp[day][transNumber] = max(
                        -prices[day] + dp[day + 1][transNumber + 1],
                        dp[day + 1][transNumber]
                    )
                } else {
                    dp[day][transNumber] = max(
                        prices[day] + dp[day + 1][transNumber + 1],
                        dp[day + 1][transNumber]
                    )
                }
            }
        }

        return dp[0][0]
    }

    // 4️⃣ SPACE OPTIMIZED (Striver Final)
    func spaceOptimized(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count

        if n == 0 || k == 0 {
            return 0
        }

        // Unlimited transactions optimization
        if k >= n / 2 {
            return quickSolve(prices)
        }

        let maxTransNumber = 2 * k
        var next = Array(repeating: 0, count: maxTransNumber + 1)
        var curr = Array(repeating: 0, count: maxTransNumber + 1)

        for day in stride(from: n - 1, through: 0, by: -1) {
            for transNumber in 0..<maxTransNumber {

                if transNumber % 2 == 0 {
                    curr[transNumber] = max(
                        -prices[day] + next[transNumber + 1],
                        next[transNumber]
                    )
                } else {
                    curr[transNumber] = max(
                        prices[day] + next[transNumber + 1],
                        next[transNumber]
                    )
                }
            }
            next = curr
        }

        return next[0]
    }

    // Helper for unlimited transactions case
    private func quickSolve(_ prices: [Int]) -> Int {
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                profit += prices[i] - prices[i - 1]
            }
        }
        return profit
    }
}
