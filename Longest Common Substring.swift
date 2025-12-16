class Solution {

    // =========================================================
    // 1️⃣ BRUTE FORCE APPROACH
    // =========================================================
    // TC: O(n^3)
    // SC: O(1)
    // ---------------------------------------------------------
    // Generate all substrings of s1 and check
    // if they appear in s2
    func longestCommonSubstringBrute(_ s1: String, _ s2: String) -> Int {
        
        let a = Array(s1)
        let b = Array(s2)
        
        let n = a.count
        let m = b.count
        
        var ans = 0
        
        // Generate all substrings of s1
        for i in 0..<n {
            for j in i..<n {
                
                let length = j - i + 1
                
                // Try to match this substring with s2
                for k in 0..<m {
                    var p = i
                    var q = k
                    
                    while p <= j && q < m && a[p] == b[q] {
                        p += 1
                        q += 1
                    }
                    
                    // If entire substring matched
                    if p > j {
                        ans = max(ans, length)
                        break
                    }
                }
            }
        }
        
        return ans
    }
    

    // =========================================================
    // 2️⃣ NORMAL DP (2D TABLE)
    // =========================================================
    // TC: O(n * m)
    // SC: O(n * m)
    // ---------------------------------------------------------
    // dp[i][j] = length of longest common substring
    // ending at s1[i-1] and s2[j-1]
    func longestCommonSubstringDP(_ s1: String, _ s2: String) -> Int {
        
        let a = Array(s1)
        let b = Array(s2)
        
        let n = a.count
        let m = b.count
        
        var dp = Array(
            repeating: Array(repeating: 0, count: m + 1),
            count: n + 1
        )
        
        var ans = 0
        
        for i in 1...n {
            for j in 1...m {
                
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                    ans = max(ans, dp[i][j])
                } else {
                    // Reset because substring must be continuous
                    dp[i][j] = 0
                }
            }
        }
        
        return ans
    }
    

    // =========================================================
    // 3️⃣ SPACE OPTIMIZED DP (1D ARRAY)
    // =========================================================
    // TC: O(n * m)
    // SC: O(m)
    // ---------------------------------------------------------
    // Uses only previous row instead of full DP table
    func longestCommonSubstringOptimized(_ s1: String, _ s2: String) -> Int {
        
        let a = Array(s1)
        let b = Array(s2)
        
        let n = a.count
        let m = b.count
        
        var prev = Array(repeating: 0, count: m + 1)
        var curr = Array(repeating: 0, count: m + 1)
        
        var ans = 0
        
        for i in 1...n {
            for j in 1...m {
                
                if a[i - 1] == b[j - 1] {
                    curr[j] = 1 + prev[j - 1]
                    ans = max(ans, curr[j])
                } else {
                    curr[j] = 0
                }
            }
            
            // Move current row to previous
            prev = curr
        }
        
        return ans
    }
}
