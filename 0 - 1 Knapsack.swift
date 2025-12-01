class Solution {

    // ============================================================
    // PUBLIC FUNCTION → choose any method
    // ============================================================
    func knapSack(_ weights: [Int], _ values: [Int], _ maxWeight: Int) -> Int {

        let n = weights.count

        // 1️⃣ Recursion
        // return recursion(weights, values, n - 1, maxWeight)

        // 2️⃣ Memoization
        // var dp = Array(repeating: Array(repeating: -1, count: maxWeight + 1), count: n)
        // return memo(weights, values, n - 1, maxWeight, &dp)

        // 3️⃣ Tabulation
        // return tab(weights, values, maxWeight)

        // 4️⃣ Space Optimized (Striver Final)
        return spaceOptimized(weights, values, maxWeight)
    }


    // ============================================================
    // 1️⃣ PURE RECURSION (Exponential)
    // ============================================================
    func recursion(_ weights: [Int], _ values: [Int],
                   _ index: Int, _ currentWeight: Int) -> Int {

        // Base case: Only 1 item left (index = 0)
        if index == 0 {
            if weights[0] <= currentWeight {
                return values[0]   // we take it
            }
            return 0
        }

        // Option 1 → Not take
        let notTake = recursion(weights, values, index - 1, currentWeight)

        // Option 2 → Take (only if weight fits)
        var take = Int.min
        if weights[index] <= currentWeight {
            take = values[index] +
                   recursion(weights, values, index - 1,
                             currentWeight - weights[index])
        }

        return max(take, notTake)
    }


    // ============================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // ============================================================
    func memo(_ weights: [Int], _ values: [Int],
              _ index: Int, _ currentWeight: Int,
              _ dp: inout [[Int]]) -> Int {

        if index == 0 {
            if weights[0] <= currentWeight {
                return values[0]
            }
            return 0
        }

        // Already computed?
        if dp[index][currentWeight] != -1 {
            return dp[index][currentWeight]
        }

        let notTake = memo(weights, values, index - 1, currentWeight, &dp)

        var take = Int.min
        if weights[index] <= currentWeight {
            take = values[index] +
                   memo(weights, values, index - 1,
                        currentWeight - weights[index], &dp)
        }

        dp[index][currentWeight] = max(take, notTake)
        return dp[index][currentWeight]
    }


    // ============================================================
    // 3️⃣ TABULATION (Bottom-Up)
    // dp[i][w] = max profit with items [0..i] and capacity w
    // ============================================================
    func tab(_ weights: [Int], _ values: [Int], _ maxWeight: Int) -> Int {

        let n = weights.count
        var dp = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: n)

        // Base row → only item 0
        for w in weights[0]...maxWeight {
            dp[0][w] = values[0]
        }

        for i in 1..<n {
            for currentWeight in 0...maxWeight {

                let notTake = dp[i - 1][currentWeight]

                var take = Int.min
                if weights[i] <= currentWeight {
                    take = values[i] + dp[i - 1][currentWeight - weights[i]]
                }

                dp[i][currentWeight] = max(take, notTake)
            }
        }

        return dp[n - 1][maxWeight]
    }


    // ============================================================
    // 4️⃣ SINGLE ROW SPACE OPTIMIZED (STRIVER FINAL)
    // dp[w] = best value for capacity w
    //
    // Traverse weights backwards so we do not reuse same item twice.
    // ============================================================
    func spaceOptimized(_ weights: [Int], _ values: [Int], _ maxWeight: Int) -> Int {

        var dp = Array(repeating: 0, count: maxWeight + 1)

        // Base case: first item fills all capacities >= its weight
        if weights[0] <= maxWeight {
            for currentWeight in weights[0]...maxWeight {
                dp[currentWeight] = values[0]
            }
        }

        for i in 1..<weights.count {

            for currentWeight in stride(from: maxWeight, through: 0, by: -1) {

                let notTake = dp[currentWeight]

                var take = Int.min
                if weights[i] <= currentWeight {
                    take = values[i] + dp[currentWeight - weights[i]]
                }

                dp[currentWeight] = max(take, notTake)
            }
        }

        return dp[maxWeight]
    }
}
