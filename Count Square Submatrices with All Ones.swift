class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        let m = matrix[0].count
        
        // dp[i][j] = size of largest square of 1s
        // with bottom-right corner at (i, j)
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        var totalSquares = 0
        
        // ✅ Base Case: Copy 0th row
        for j in 0..<m {
            dp[0][j] = matrix[0][j]
            totalSquares += dp[0][j]
        }
        
        // ✅ Base Case: Copy 0th column
        for i in 1..<n { // start from 1 to avoid double counting (0,0)
            dp[i][0] = matrix[i][0]
            totalSquares += dp[i][0]
        }
        
        // ✅ Fill rest of dp table
        for i in 1..<n {
            for j in 1..<m {
                if matrix[i][j] == 1 {
                    dp[i][j] = 1 + min(dp[i-1][j],
                                       dp[i][j-1],
                                       dp[i-1][j-1])
                    totalSquares += dp[i][j]
                }
            }
        }
        
        return totalSquares
    }
}
