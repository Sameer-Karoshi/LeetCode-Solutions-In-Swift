class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        
        let a = Array(str1)
        let b = Array(str2)
        
        let n = a.count
        let m = b.count
        
        // 1️⃣ LCS DP Table
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...m {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        // 2️⃣ Build SCS using backtracking
        var i = n
        var j = m
        var result: [Character] = []
        
        while i > 0 && j > 0 {
            if a[i - 1] == b[j - 1] {
                result.append(a[i - 1])
                i -= 1
                j -= 1
            } else if dp[i - 1][j] > dp[i][j - 1] {
                result.append(a[i - 1])
                i -= 1
            } else {
                result.append(b[j - 1])
                j -= 1
            }
        }
        
        // 3️⃣ Add remaining characters
        while i > 0 {
            result.append(a[i - 1])
            i -= 1
        }
        
        while j > 0 {
            result.append(b[j - 1])
            j -= 1
        }
        
        // 4️⃣ Reverse to get final answer
        return String(result.reversed())
    }
}
