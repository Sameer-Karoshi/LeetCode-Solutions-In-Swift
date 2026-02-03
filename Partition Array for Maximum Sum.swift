class Solution {

    // =====================================================
    // 1️⃣ RECURSION (Brute Force)
    // =====================================================
    // Time: O(k^n) (Exponential)
    // Space: O(n) (Recursion stack)

    func maxSumAfterPartitioning_recursion(_ arr: [Int], _ k: Int) -> Int {
        return solveRec(0, arr, k)
    }

    private func solveRec(_ i: Int, _ arr: [Int], _ k: Int) -> Int {
        // Base case: reached end
        if i == arr.count { return 0 }

        var maxElement = 0
        var ans = 0

        // Try partitions of size 1 to k
        for j in i..<min(i + k, arr.count) {
            maxElement = max(maxElement, arr[j])
            let len = j - i + 1
            let sum = maxElement * len + solveRec(j + 1, arr, k)
            ans = max(ans, sum)
        }
        return ans
    }

    // =====================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // =====================================================
    // Time: O(n * k)
    // Space: O(n) DP + O(n) recursion stack

    func maxSumAfterPartitioning_memo(_ arr: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: -1, count: arr.count)
        return solveMemo(0, arr, k, &dp)
    }

    private func solveMemo(_ i: Int, _ arr: [Int], _ k: Int, _ dp: inout [Int]) -> Int {
        // Base case
        if i == arr.count { return 0 }

        // If already computed
        if dp[i] != -1 { return dp[i] }

        var maxElement = 0
        var ans = 0

        for j in i..<min(i + k, arr.count) {
            maxElement = max(maxElement, arr[j])
            let len = j - i + 1
            let sum = maxElement * len + solveMemo(j + 1, arr, k, &dp)
            ans = max(ans, sum)
        }

        dp[i] = ans
        return ans
    }

    // =====================================================
    // 3️⃣ TABULATION (Bottom-Up DP) — Striver Preferred
    // =====================================================
    // Time: O(n * k)
    // Space: O(n)

    func maxSumAfterPartitioning_tabulation(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        var dp = Array(repeating: 0, count: n + 1)

        // Base case:
        // dp[n] = 0 → if index reaches end, no sum possible

        // Fill from right to left
        for i in stride(from: n - 1, through: 0, by: -1) {
            var maxElement = 0
            var best = 0

            // Try partitions of size 1 to k
            for j in i..<min(i + k, n) {
                maxElement = max(maxElement, arr[j])
                let len = j - i + 1
                let sum = maxElement * len + dp[j + 1]
                best = max(best, sum)
            }
            dp[i] = best
        }

        return dp[0]
    }

    // =====================================================
    // 4️⃣ SPACE OPTIMIZED (Same as Tabulation here)
    // =====================================================
    // Since dp[i] only depends on dp[j+1], we already use O(n)
    // Further optimization not possible without losing clarity

    func maxSumAfterPartitioning_spaceOptimized(_ arr: [Int], _ k: Int) -> Int {
        return maxSumAfterPartitioning_tabulation(arr, k)
    }
}
