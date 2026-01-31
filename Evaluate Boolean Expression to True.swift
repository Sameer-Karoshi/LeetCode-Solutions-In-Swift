class Solution {

    // MARK: - Public Function
    func countWays(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.count

        // dp[i][j][isTrue] → number of ways substring i...j evaluates to isTrue
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: -1, count: 2),
                count: n
            ),
            count: n
        )

        // Call both recursion & memoized version here
        // return solveRec(0, n - 1, true, arr)     // Pure recursion
        return solveMemo(0, n - 1, 1, arr, &dp)     // Memoization
    }

    // ============================================================
    // 1️⃣ PURE RECURSION (Brute Force)
    // ============================================================
    // isTrue → true means we want expression to evaluate to True
    func solveRec(_ i: Int, _ j: Int, _ isTrue: Bool, _ arr: [Character]) -> Int {

        // Base case: invalid range
        if i > j { return 0 }

        // Base case: single character
        if i == j {
            if isTrue {
                return arr[i] == "T" ? 1 : 0
            } else {
                return arr[i] == "F" ? 1 : 0
            }
        }

        var ways = 0

        // Try partitioning at every operator
        for k in stride(from: i + 1, to: j, by: 2) {

            // Solve left & right for both true and false
            let lt = solveRec(i, k - 1, true, arr)
            let lf = solveRec(i, k - 1, false, arr)
            let rt = solveRec(k + 1, j, true, arr)
            let rf = solveRec(k + 1, j, false, arr)

            let op = arr[k]

            // Combine results based on operator truth table
            if op == "&" {
                if isTrue {
                    ways += lt * rt
                } else {
                    ways += lf * rt + lt * rf + lf * rf
                }
            } else if op == "|" {
                if isTrue {
                    ways += lt * rt + lt * rf + lf * rt
                } else {
                    ways += lf * rf
                }
            } else { // "^"
                if isTrue {
                    ways += lt * rf + lf * rt
                } else {
                    ways += lt * rt + lf * rf
                }
            }
        }

        return ways
    }

    // ============================================================
    // 2️⃣ MEMOIZATION (Optimized DP)
    // ============================================================
    // isTrue = 1 → true, 0 → false
    func solveMemo(_ i: Int, _ j: Int, _ isTrue: Int,
                   _ arr: [Character], _ dp: inout [[[Int]]]) -> Int {

        // Base case: invalid range
        if i > j { return 0 }

        // Base case: single character
        if i == j {
            if isTrue == 1 {
                return arr[i] == "T" ? 1 : 0
            } else {
                return arr[i] == "F" ? 1 : 0
            }
        }

        // If already computed, return stored value
        if dp[i][j][isTrue] != -1 {
            return dp[i][j][isTrue]
        }

        var ways = 0

        // Try partitioning at every operator
        for k in stride(from: i + 1, to: j, by: 2) {

            let lt = solveMemo(i, k - 1, 1, arr, &dp)
            let lf = solveMemo(i, k - 1, 0, arr, &dp)
            let rt = solveMemo(k + 1, j, 1, arr, &dp)
            let rf = solveMemo(k + 1, j, 0, arr, &dp)

            let op = arr[k]

            if op == "&" {
                if isTrue == 1 {
                    ways += lt * rt
                } else {
                    ways += lf * rt + lt * rf + lf * rf
                }
            } else if op == "|" {
                if isTrue == 1 {
                    ways += lt * rt + lt * rf + lf * rt
                } else {
                    ways += lf * rf
                }
            } else { // "^"
                if isTrue == 1 {
                    ways += lt * rf + lf * rt
                } else {
                    ways += lt * rt + lf * rf
                }
            }
        }

        dp[i][j][isTrue] = ways
        return ways
    }
}
