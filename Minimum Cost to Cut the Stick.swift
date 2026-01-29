class Solution {

    // =====================================================
    // 1️⃣ RECURSION (Brute Force)
    // Time Complexity: Exponential
    // Space Complexity: O(c) -> recursion stack
    // =====================================================
    func minCostRecursion(_ n: Int, _ cuts: [Int]) -> Int {
        var arr = cuts
        arr.append(0)
        arr.append(n)
        arr.sort()

        return solveRec(1, arr.count - 2, arr)
    }

    private func solveRec(_ i: Int, _ j: Int, _ arr: [Int]) -> Int {
        // Base case: no cuts left
        if i > j { return 0 }

        var mini = Int.max

        // Try every possible cut k
        for k in i...j {
            let cost = arr[j + 1] - arr[i - 1] +
                       solveRec(i, k - 1, arr) +
                       solveRec(k + 1, j, arr)
            mini = min(mini, cost)
        }

        return mini
    }


    // =====================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // Time Complexity: O(c^3)
    // Space Complexity: O(c^2) + O(c) recursion stack
    // =====================================================
    func minCostMemo(_ n: Int, _ cuts: [Int]) -> Int {
        var arr = cuts
        arr.append(0)
        arr.append(n)
        arr.sort()

        let c = arr.count
        var dp = Array(repeating: Array(repeating: -1, count: c), count: c)

        return solveMemo(1, c - 2, arr, &dp)
    }

    private func solveMemo(_ i: Int, _ j: Int, _ arr: [Int], _ dp: inout [[Int]]) -> Int {
        // Base case
        if i > j { return 0 }

        // Already computed
        if dp[i][j] != -1 { return dp[i][j] }

        var mini = Int.max

        for k in i...j {
            let cost = arr[j + 1] - arr[i - 1] +
                       solveMemo(i, k - 1, arr, &dp) +
                       solveMemo(k + 1, j, arr, &dp)
            mini = min(mini, cost)
        }

        dp[i][j] = mini
        return mini
    }


    // =====================================================
    // 3️⃣ TABULATION (Bottom-Up DP — Exact Striver Style)
    // Time Complexity: O(c^3)
    // Space Complexity: O(c^2)
    // =====================================================
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {

        // Step 1: Add boundaries and sort
        var arr = cuts
        arr.append(0)
        arr.append(n)
        arr.sort()

        let c = arr.count   // = cuts.count + 2

        // dp[i][j] = minimum cost to cut stick using cuts from i to j
        var dp = Array(repeating: Array(repeating: 0, count: c), count: c)

        // Step 2: Fill DP table (Striver loop order)
        // i -> decreasing, j -> increasing
        for i in stride(from: c - 2, through: 1, by: -1) {   // i = last cut → first cut
            for j in i...(c - 2) {                           // j = i → last cut

                var mini = Int.max

                // Try all possible partition points
                for k in i...j {
                    let cost = arr[j + 1] - arr[i - 1] +   // cost of current stick
                               dp[i][k - 1] +              // left part
                               dp[k + 1][j]                // right part
                    mini = min(mini, cost)
                }

                dp[i][j] = mini
            }
        }

        // Final answer for full stick
        return dp[1][c - 2]
    }
}
