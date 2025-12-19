class Solution {

    func minInsertionsDeletions(_ str1: String, _ str2: String) -> Int {
        let n = str1.count
        let m = str2.count
        
        let s1 = Array(str1)
        let s2 = Array(str2)
        
        // DP table for LCS
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...m {
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        let lcs = dp[n][m]
        
        let deletions = n - lcs
        let insertions = m - lcs
        
        return deletions + insertions
    }
}
