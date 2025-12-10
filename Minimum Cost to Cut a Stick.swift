import Foundation

class Solution {

    // ---------------------------------------------------------
    // 1️⃣ RECURSIVE (BRUTE FORCE)
    // Time: Exponential
    // ---------------------------------------------------------
    func cutRodRecursive(_ price: [Int], _ n: Int) -> Int {

        func solve(_ index: Int, _ remaining: Int) -> Int {
            // Base case → only length 1 pieces allowed
            if index == 0 {
                return remaining * price[0]
            }

            // Not take (move to smaller index)
            let notTake = solve(index - 1, remaining)

            // Take current rod length
            var take = Int.min
            let rodLength = index + 1
            if rodLength <= remaining {
                take = price[index] + solve(index, remaining - rodLength)
            }

            return max(take, notTake)
        }

        return solve(price.count - 1, n)
    }

    // ---------------------------------------------------------
    // 2️⃣ MEMOIZATION (TOP-DOWN DP)
    // Time: O(N²), Space: O(N²)
    // ---------------------------------------------------------
    func cutRodMemo(_ price: [Int], _ n: Int) -> Int {
        var dp = Array(
            repeating: Array(repeating: -1, count: n + 1),
            count: price.count
        )

        func solve(_ index: Int, _ remaining: Int) -> Int {

            if index == 0 {
                return remaining * price[0]
            }

            if dp[index][remaining] != -1 {
                return dp[index][remaining]
            }

            let notTake = solve(index - 1, remaining)

            var take = Int.min
            let rodLength = index + 1
            if rodLength <= remaining {
                take = price[index] + solve(index, remaining - rodLength)
            }

            dp[index][remaining] = max(take, notTake)
            return dp[index][remaining]
        }

        return solve(price.count - 1, n)
    }

    // ---------------------------------------------------------
    // 3️⃣ TABULATION (BOTTOM-UP DP)
    // Time: O(N²), Space: O(N²)
    // ---------------------------------------------------------
    func cutRodTab(_ price: [Int], _ n: Int) -> Int {

        let m = price.count
        var dp = Array(
            repeating: Array(repeating: 0, count: n + 1),
            count: m
        )

        // Base case: only rod of length 1
        for length in 0...n {
            dp[0][length] = length * price[0]
        }

        for index in 1..<m {
            for remaining in 0...n {

                let notTake = dp[index - 1][remaining]
                var take = Int.min

                let rodLength = index + 1
                if rodLength <= remaining {
                    take = price[index] + dp[index][remaining - rodLength]
                }

                dp[index][remaining] = max(take, notTake)
            }
        }

        return dp[m - 1][n]
    }

    // ---------------------------------------------------------
    // 4️⃣ **1D SPACE OPTIMIZATION (FINAL STRIVER METHOD)**
    // Time: O(N²), Space: O(N)
    // ---------------------------------------------------------
    func cutRod1D(_ price: [Int], _ n: Int) -> Int {

        // dp[x] = maximum profit for rod length x
        var dp = Array(repeating: 0, count: n + 1)

        // Base case: using only rod length 1
        for length in 0...n {
            dp[length] = length * price[0]
        }

        // Unbounded knapsack pattern
        for index in 1..<price.count {
            let rodLength = index + 1

            for remaining in rodLength...n {
                dp[remaining] = max(
                    dp[remaining],                      // not take
                    price[index] + dp[remaining - rodLength] // take
                )
            }
        }

        return dp[n]
    }
}
