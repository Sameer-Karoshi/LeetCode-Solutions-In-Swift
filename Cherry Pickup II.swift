class Solution {

    // ---------------------------------------------------------
    // 1. PURE RECURSION (EXPO)
    // ---------------------------------------------------------
    func cherryPickupRecursion(_ grid: [[Int]]) -> Int {
        let n = grid.count, m = grid[0].count

        func dfs(_ r: Int, _ c1: Int, _ c2: Int) -> Int {
            if c1 < 0 || c2 < 0 || c1 >= m || c2 >= m { return -1_000_000_000 }
            if r == n - 1 {
                return c1 == c2 ? grid[r][c1] : grid[r][c1] + grid[r][c2]
            }

            var maxi = -1_000_000_000
            for d1 in -1...1 {
                for d2 in -1...1 {
                    maxi = max(maxi, dfs(r + 1, c1 + d1, c2 + d2))
                }
            }
            let gain = c1 == c2 ? grid[r][c1] : grid[r][c1] + grid[r][c2]
            return gain + maxi
        }

        return dfs(0, 0, m - 1)
    }

    // ---------------------------------------------------------
    // 2. MEMOIZATION (TOP-DOWN)
    // ---------------------------------------------------------
    func cherryPickupMemo(_ grid: [[Int]]) -> Int {
        let n = grid.count, m = grid[0].count
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: Int.min, count: m),
                count: m),
            count: n
        )

        func dfs(_ r: Int, _ c1: Int, _ c2: Int) -> Int {
            if c1 < 0 || c2 < 0 || c1 >= m || c2 >= m { return -1_000_000_000 }
            if dp[r][c1][c2] != Int.min { return dp[r][c1][c2] }

            if r == n - 1 {
                dp[r][c1][c2] = (c1 == c2) ? grid[r][c1] : grid[r][c1] + grid[r][c2]
                return dp[r][c1][c2]
            }

            var maxi = -1_000_000_000
            for d1 in -1...1 {
                for d2 in -1...1 {
                    maxi = max(maxi, dfs(r + 1, c1 + d1, c2 + d2))
                }
            }

            let gain = c1 == c2 ? grid[r][c1] : grid[r][c1] + grid[r][c2]
            dp[r][c1][c2] = gain + maxi
            return dp[r][c1][c2]
        }

        return dfs(0, 0, m - 1)
    }

    // ---------------------------------------------------------
    // 3. TABULATION (BOTTOM-UP 3D DP)
    // ---------------------------------------------------------
    func cherryPickupTab(_ grid: [[Int]]) -> Int {
        let n = grid.count, m = grid[0].count
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: -1_000_000_000, count: m),
                count: m),
            count: n
        )

        // Base case
        for c1 in 0..<m {
            for c2 in 0..<m {
                if c1 == c2 { dp[n - 1][c1][c2] = grid[n - 1][c1] }
                else { dp[n - 1][c1][c2] = grid[n - 1][c1] + grid[n - 1][c2] }
            }
        }

        for r in stride(from: n - 2, through: 0, by: -1) {
            for c1 in 0..<m {
                for c2 in 0..<m {
                    var maxi = -1_000_000_000
                    for d1 in -1...1 {
                        for d2 in -1...1 {
                            let nc1 = c1 + d1
                            let nc2 = c2 + d2
                            if nc1 >= 0 && nc2 >= 0 && nc1 < m && nc2 < m {
                                maxi = max(maxi, dp[r + 1][nc1][nc2])
                            }
                        }
                    }
                    let gain = c1 == c2 ? grid[r][c1] : grid[r][c1] + grid[r][c2]
                    dp[r][c1][c2] = gain + maxi
                }
            }
        }

        return dp[0][0][m - 1]
    }

    // ---------------------------------------------------------
    // 4. SPACE OPTIMIZED (2D DP)
    // ---------------------------------------------------------
    func cherryPickupSpaceOpt(_ grid: [[Int]]) -> Int {
        let n = grid.count, m = grid[0].count

        var front = Array(
            repeating: Array(repeating: -1_000_000_000, count: m),
            count: m
        )
        var cur = Array(
            repeating: Array(repeating: -1_000_000_000, count: m),
            count: m
        )

        // Base row
        for c1 in 0..<m {
            for c2 in 0..<m {
                if c1 == c2 { front[c1][c2] = grid[n - 1][c1] }
                else { front[c1][c2] = grid[n - 1][c1] + grid[n - 1][c2] }
            }
        }

        for r in stride(from: n - 2, through: 0, by: -1) {
            for c1 in 0..<m {
                for c2 in 0..<m {
                    var maxi = -1_000_000_000
                    for d1 in -1...1 {
                        for d2 in -1...1 {
                            let nc1 = c1 + d1
                            let nc2 = c2 + d2
                            if nc1 >= 0 && nc2 >= 0 && nc1 < m && nc2 < m {
                                maxi = max(maxi, front[nc1][nc2])
                            }
                        }
                    }
                    let gain = c1 == c2 ? grid[r][c1] : grid[r][c1] + grid[r][c2]
                    cur[c1][c2] = gain + maxi
                }
            }
            front = cur
        }

        return front[0][m - 1]
    }
}
