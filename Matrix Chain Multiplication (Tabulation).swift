class Solution {
    
    func matrixMultiplication(_ arr: [Int]) -> Int {
        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        // Base case:
        // dp[i][i] = 0 (already initialized)
        
        for i in stride(from: n - 1, through: 1, by: -1) {
            for j in i + 1..<n {
                var mini = Int.max
                
                for k in i..<j {
                    let steps = dp[i][k] +
                                dp[k + 1][j] +
                                arr[i - 1] * arr[k] * arr[j]
                    
                    mini = min(mini, steps)
                }
                
                dp[i][j] = mini
            }
        }
        
        return dp[1][n - 1]
    }
}
