class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        
        // Convert string to array for easy indexing
        let arr1 = Array(s)
        let arr2 = Array(s.reversed())
        
        // DP table where dp[i][j] = LCS of first i chars of arr1 and first j chars of arr2
        var dp = Array(
            repeating: Array(repeating: 0, count: n + 1),
            count: n + 1
        )
        
        // Fill DP table (Bottom-Up)
        for i in 1...n {
            for j in 1...n {
                if arr1[i - 1] == arr2[j - 1] {
                    // Characters match → take diagonal + 1
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    // Characters don't match → take max of left or top
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        // The answer is the LCS of full string and its reverse
        return dp[n][n]
    }
}
