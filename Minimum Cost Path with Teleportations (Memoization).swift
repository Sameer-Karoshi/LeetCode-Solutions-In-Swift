class Solution {
    func minCost(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        let INF = Int.max / 2

        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: -1, count: k + 1),
                count: n
            ),
            count: m
        )
        
        func minPath(_ r: Int, _ c: Int, _ used: Int, _ dp: inout [[[Int]]]) -> Int {
            if r == 0 && c == 0 {
                return 0
            }
            
            if r < 0 || c < 0 {
                return INF
            }
            
            if dp[r][c][used] != -1 {
                return dp[r][c][used]
            }
            
            let up = minPath(r - 1, c, used, &dp)
            let left = minPath(r, c - 1, used, &dp)
            var ans = grid[r][c] + min(up, left)
            
            // Teleport: can teleport from any cell with value >= current cell
            if used < k {
                for i in 0..<m {
                    for j in 0..<n {
                        if grid[i][j] >= grid[r][c] {
                            ans = min(ans, minPath(i, j, used + 1, &dp))
                        }
                    }
                }
            }
            
            dp[r][c][used] = ans
            return ans
        }
        
        return minPath(m - 1, n - 1, 0, &dp)
    }
}
