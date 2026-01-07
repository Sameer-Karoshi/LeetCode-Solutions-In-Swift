import Foundation

class Solution {

    // =====================================================
    // 1️⃣ RECURSION (Brute Force)
    // =====================================================
    func isMatchRec(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s), pArr = Array(p)
        return recHelper(sArr.count - 1, pArr.count - 1, sArr, pArr)
    }

    private func recHelper(_ i: Int, _ j: Int,
                           _ s: [Character], _ p: [Character]) -> Bool {

        // Both string and pattern exhausted
        if i < 0 && j < 0 { return true }

        // Pattern exhausted but string remains
        if j < 0 { return false }

        // String exhausted, check remaining pattern
        if i < 0 {
            for k in 0...j {
                if p[k] != "*" { return false }
            }
            return true
        }

        // Characters match or '?'
        if p[j] == s[i] || p[j] == "?" {
            return recHelper(i - 1, j - 1, s, p)
        }

        // '*' matches empty OR consumes one char
        if p[j] == "*" {
            return recHelper(i, j - 1, s, p) || recHelper(i - 1, j, s, p)
        }

        return false
    }

    // =====================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // =====================================================
    func isMatchMemo(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s), pArr = Array(p)
        var dp = Array(
            repeating: Array(repeating: -1, count: pArr.count),
            count: sArr.count
        )
        return memoHelper(sArr.count - 1, pArr.count - 1, sArr, pArr, &dp)
    }

    private func memoHelper(_ i: Int, _ j: Int,
                            _ s: [Character], _ p: [Character],
                            _ dp: inout [[Int]]) -> Bool {

        if i < 0 && j < 0 { return true }
        if j < 0 { return false }
        if i < 0 {
            for k in 0...j {
                if p[k] != "*" { return false }
            }
            return true
        }

        if dp[i][j] != -1 { return dp[i][j] == 1 }

        var ans = false
        if p[j] == s[i] || p[j] == "?" {
            ans = memoHelper(i - 1, j - 1, s, p, &dp)
        } else if p[j] == "*" {
            ans = memoHelper(i, j - 1, s, p, &dp) || memoHelper(i - 1, j, s, p, &dp)
        }

        dp[i][j] = ans ? 1 : 0
        return ans
    }

    // =====================================================
    // 3️⃣ TABULATION (Bottom-Up DP with Flag Technique)
    // =====================================================
    func isMatchTab(_ s: String, _ p: String) -> Bool {

        let sArr = Array(s), pArr = Array(p)
        let n = sArr.count, m = pArr.count

        var dp = Array(
            repeating: Array(repeating: false, count: m + 1),
            count: n + 1
        )

        // Base case: empty string & empty pattern
        dp[0][0] = true

        // ===== FLAG TECHNIQUE for first row =====
        var flag = true
        for j in 1...m {
            if pArr[j - 1] != "*" { flag = false }
            dp[0][j] = flag
        }

        // Fill remaining DP table
        for i in 1...n {
            for j in 1...m {
                if pArr[j - 1] == sArr[i - 1] || pArr[j - 1] == "?" {
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pArr[j - 1] == "*" {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                }
            }
        }

        return dp[n][m]
    }

    // =====================================================
    // 4️⃣ SPACE OPTIMIZED DP (Striver Style, no extra flag)
    // =====================================================
    func isMatch(_ s: String, _ p: String) -> Bool {

        let sArr = Array(s), pArr = Array(p)
        let n = sArr.count, m = pArr.count

        var prev = Array(repeating: false, count: m + 1)
        var curr = Array(repeating: false, count: m + 1)

        // Base case: empty string & empty pattern
        prev[0] = true

        // ===== Striver-style first row initialization =====
        for j in 1...m {
            prev[j] = prev[j - 1] && (pArr[j - 1] == "*")
        }

        for i in 1...n {

            curr[0] = false // non-empty string cannot match empty pattern

            for j in 1...m {
                if pArr[j - 1] == sArr[i - 1] || pArr[j - 1] == "?" {
                    curr[j] = prev[j - 1]
                } else if pArr[j - 1] == "*" {
                    curr[j] = curr[j - 1] || prev[j]
                } else {
                    curr[j] = false
                }
            }

            prev = curr
        }

        return prev[m]
    }
}
