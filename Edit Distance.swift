class EditDistance {

    // --------------------------------------------------
    // 1️⃣ RECURSION (Brute Force)
    // --------------------------------------------------
    // Time: O(3^(n+m))
    // Space: O(n+m) (recursion stack)

    func editDistanceRec(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1)
        let b = Array(s2)
        return helperRec(a, b, a.count - 1, b.count - 1)
    }

    private func helperRec(_ a: [Character], _ b: [Character], _ i: Int, _ j: Int) -> Int {

        // If first string is exhausted, insert remaining characters of second
        if i < 0 { return j + 1 }

        // If second string is exhausted, delete remaining characters of first
        if j < 0 { return i + 1 }

        // If characters match, move both pointers
        if a[i] == b[j] {
            return helperRec(a, b, i - 1, j - 1)
        }

        // Three operations:
        let insertOp = 1 + helperRec(a, b, i, j - 1)
        let deleteOp = 1 + helperRec(a, b, i - 1, j)
        let replaceOp = 1 + helperRec(a, b, i - 1, j - 1)

        return min(insertOp, deleteOp, replaceOp)
    }

    // --------------------------------------------------
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // --------------------------------------------------
    // Time: O(n*m)
    // Space: O(n*m) + recursion stack

    func editDistanceMemo(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1)
        let b = Array(s2)

        var dp = Array(
            repeating: Array(repeating: -1, count: b.count),
            count: a.count
        )

        return helperMemo(a, b, a.count - 1, b.count - 1, &dp)
    }

    private func helperMemo(
        _ a: [Character],
        _ b: [Character],
        _ i: Int,
        _ j: Int,
        _ dp: inout [[Int]]
    ) -> Int {

        if i < 0 { return j + 1 }
        if j < 0 { return i + 1 }

        if dp[i][j] != -1 {
            return dp[i][j]
        }

        if a[i] == b[j] {
            dp[i][j] = helperMemo(a, b, i - 1, j - 1, &dp)
        } else {
            let insertOp = 1 + helperMemo(a, b, i, j - 1, &dp)
            let deleteOp = 1 + helperMemo(a, b, i - 1, j, &dp)
            let replaceOp = 1 + helperMemo(a, b, i - 1, j - 1, &dp)

            dp[i][j] = min(insertOp, deleteOp, replaceOp)
        }

        return dp[i][j]
    }

    // --------------------------------------------------
    // 3️⃣ TABULATION (Bottom-Up DP)
    // --------------------------------------------------
    // Time: O(n*m)
    // Space: O(n*m)

    func editDistanceTabulation(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1)
        let b = Array(s2)

        let n = a.count
        let m = b.count

        var dp = Array(
            repeating: Array(repeating: 0, count: m + 1),
            count: n + 1
        )

        // Base cases
        for i in 0...n { dp[i][0] = i } // delete all
        for j in 0...m { dp[0][j] = j } // insert all

        // Fill DP table
        for i in 1...n {
            for j in 1...m {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = 1 + min(
                        dp[i][j - 1],     // insert
                        dp[i - 1][j],     // delete
                        dp[i - 1][j - 1]  // replace
                    )
                }
            }
        }

        return dp[n][m]
    }

    // --------------------------------------------------
    // 4️⃣ SPACE OPTIMIZATION
    // --------------------------------------------------
    // Time: O(n*m)
    // Space: O(m)

    func editDistanceSpaceOptimized(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1)
        let b = Array(s2)

        let n = a.count
        let m = b.count

        var prev = Array(0...m) // base row

        for i in 1...n {
            var curr = Array(repeating: 0, count: m + 1)
            curr[0] = i

            for j in 1...m {
                if a[i - 1] == b[j - 1] {
                    curr[j] = prev[j - 1]
                } else {
                    curr[j] = 1 + min(
                        curr[j - 1], // insert
                        prev[j],     // delete
                        prev[j - 1]  // replace
                    )
                }
            }
            prev = curr
        }

        return prev[m]
    }
}
