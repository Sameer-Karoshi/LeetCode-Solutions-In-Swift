// MARK: - Striver Style LCS Starting From End (i = n-1, j = m-1)

class SolutionLCS {

    // -------------------------------------------------------------
    // 1️⃣ PURE RECURSION — Start From End
    // -------------------------------------------------------------
    func lcsRecursive(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1), b = Array(s2)
        let n = a.count, m = b.count

        func solve(_ i: Int, _ j: Int) -> Int {
            // Base case: if any index goes negative
            if i < 0 || j < 0 { return 0 }

            // Match → take 1 + move both
            if a[i] == b[j] {
                return 1 + solve(i - 1, j - 1)
            }

            // Else → explore both directions
            return max(
                solve(i - 1, j),
                solve(i, j - 1)
            )
        }

        return solve(n - 1, m - 1)
    }

    // -------------------------------------------------------------
    // 2️⃣ MEMOIZATION — Top-Down DP from END
    // -------------------------------------------------------------
    func lcsMemo(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1), b = Array(s2)
        let n = a.count, m = b.count

        var dp = Array(
            repeating: Array(repeating: -1, count: m),
            count: n
        )

        func solve(_ i: Int, _ j: Int) -> Int {
            if i < 0 || j < 0 { return 0 }

            if dp[i][j] != -1 { return dp[i][j] }

            if a[i] == b[j] {
                dp[i][j] = 1 + solve(i - 1, j - 1)
            } else {
                dp[i][j] = max(
                    solve(i - 1, j),
                    solve(i, j - 1)
                )
            }

            return dp[i][j]
        }

        return solve(n - 1, m - 1)
    }

    // -------------------------------------------------------------
    // 3️⃣ TABULATION (Bottom-Up DP)
    // Classic Striver table: dp[i][j] = LCS of prefix (0...i-1)
    // -------------------------------------------------------------
    func lcsTab(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1), b = Array(s2)
        let n = a.count, m = b.count

        var dp = Array(
            repeating: Array(repeating: 0, count: m + 1),
            count: n + 1
        )

        for i in 1...n {
            for j in 1...m {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(
                        dp[i - 1][j],
                        dp[i][j - 1]
                    )
                }
            }
        }

        return dp[n][m]
    }

    // -------------------------------------------------------------
    // 4️⃣ SPACE OPTIMIZED DP — Two Rows
    // -------------------------------------------------------------
    func lcsSpaceOpt(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1), b = Array(s2)
        let n = a.count, m = b.count

        var prev = Array(repeating: 0, count: m + 1)
        var curr = Array(repeating: 0, count: m + 1)

        for i in 1...n {
            for j in 1...m {
                if a[i - 1] == b[j - 1] {
                    curr[j] = 1 + prev[j - 1]
                } else {
                    curr[j] = max(prev[j], curr[j - 1])
                }
            }
            prev = curr
        }

        return prev[m]
    }
}
