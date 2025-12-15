class Solution {
    func printLCS(_ text1: String, _ text2: String) -> String {
        
        // Convert strings to arrays for O(1) indexing
        let s1 = Array(text1)
        let s2 = Array(text2)
        
        let n = s1.count
        let m = s2.count
        
        /*
         dp[i][j] = Length of LCS of
                    first i characters of s1
                    first j characters of s2
         
         Size is (n+1) x (m+1) to handle empty strings
        */
        var dp = Array(
            repeating: Array(repeating: 0, count: m + 1),
            count: n + 1
        )
        
        // Fill DP table
        for i in 1...n {
            for j in 1...m {
                
                // Compare (i-1) and (j-1) because strings are 0-indexed
                if s1[i - 1] == s2[j - 1] {
                    // Characters match → include it
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    // Characters don't match → take max of skipping one char
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        // Backtracking to build the LCS string
        var i = n
        var j = m
        var lcs: [Character] = []
        
        while i > 0 && j > 0 {
            
            // If characters match, they are part of LCS
            if s1[i - 1] == s2[j - 1] {
                lcs.append(s1[i - 1])
                i -= 1
                j -= 1
            }
            // Move in the direction of larger DP value
            else if dp[i - 1][j] > dp[i][j - 1] {
                i -= 1
            } else {
                j -= 1
            }
        }
        
        // Reverse because we built LCS from end to start
        return String(lcs.reversed())
    }
}
