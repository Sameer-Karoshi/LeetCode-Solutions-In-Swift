class Solution {

    // ============================
    // Helper: Check Palindrome
    // ============================
    func isPalindrome(_ chars: [Character], _ i: Int, _ j: Int) -> Bool {
        var l = i, r = j
        while l < r {
            if chars[l] != chars[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }

    // =====================================================
    // 1️⃣ Pure Recursion (Striver Style)
    // =====================================================
    // Time: O(2^n * n)   (Exponential, checking palindromes)
    // Space: O(n)       (Recursion stack)
    func minCutRecursion(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        return solveRec(0, chars, n) - 1
    }

    func solveRec(_ i: Int, _ chars: [Character], _ n: Int) -> Int {
        // Base case: reached end → no more partitions needed
        if i == n { return 0 }

        var minParts = Int.max

        // Try all partitions starting at i
        for j in i..<n {
            if isPalindrome(chars, i, j) {
                let cost = 1 + solveRec(j + 1, chars, n)
                minParts = min(minParts, cost)
            }
        }
        return minParts
    }

    // =====================================================
    // 2️⃣ Recursion + Memoization
    // =====================================================
    // Time: O(n^2)
    // Space: O(n) DP + O(n) recursion stack
    func minCutMemo(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var dp = Array(repeating: -1, count: n)
        return solveMemo(0, chars, n, &dp) - 1
    }

    func solveMemo(_ i: Int, _ chars: [Character], _ n: Int, _ dp: inout [Int]) -> Int {
        if i == n { return 0 }
        if dp[i] != -1 { return dp[i] }

        var minParts = Int.max

        for j in i..<n {
            if isPalindrome(chars, i, j) {
                let cost = 1 + solveMemo(j + 1, chars, n, &dp)
                minParts = min(minParts, cost)
            }
        }

        dp[i] = minParts
        return dp[i]
    }

    // =====================================================
    // 3️⃣ Bottom-Up Tabulation (Striver Optimized)
    // =====================================================
    // Time: O(n^2)
    // Space: O(n)
    func minCut(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count

        // dp[i] = minimum partitions from index i to end
        var dp = Array(repeating: 0, count: n + 1)
        dp[n] = 0   // Base case: no string left → 0 partitions

        // Fill from right to left (bottom-up)
        for i in stride(from: n - 1, through: 0, by: -1) {
            var minParts = Int.max

            for j in i..<n {
                if isPalindrome(chars, i, j) {
                    let cost = 1 + dp[j + 1]
                    minParts = min(minParts, cost)
                }
            }
            dp[i] = minParts
        }

        // Cuts = partitions - 1
        return dp[0] - 1
    }
}
