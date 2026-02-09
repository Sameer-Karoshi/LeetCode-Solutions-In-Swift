class Solution {

    // =====================================================
    // 1️⃣ PURE RECURSION
    // =====================================================
    // Time: O(2^n)
    // Space: O(n) (recursion stack)
    func jumpRecursive(_ nums: [Int]) -> Int {
        return rec(0, nums)
    }

    // rec(i) = minimum jumps to reach end from index i
    private func rec(_ i: Int, _ nums: [Int]) -> Int {
        if i >= nums.count - 1 { return 0 } // Base case

        let INF = Int.max / 2
        var ans = INF

        // Try all jumps from current index
        for step in 1...nums[i] {
            if i + step < nums.count {
                ans = min(ans, 1 + rec(i + step, nums))
            }
        }

        return ans
    }

    // =====================================================
    // 2️⃣ MEMOIZATION (Top-Down DP)
    // =====================================================
    // Time: O(n^2)
    // Space: O(n) dp + O(n) recursion stack
    func jumpMemo(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: -1, count: n)
        return memo(0, nums, &dp)
    }

    // memo(i) = minimum jumps to reach end from index i
    private func memo(_ i: Int, _ nums: [Int], _ dp: inout [Int]) -> Int {
        if i >= nums.count - 1 { return 0 } // Base case
        if dp[i] != -1 { return dp[i] }     // Already computed

        let INF = Int.max / 2
        var ans = INF

        for step in 1...nums[i] {
            if i + step < nums.count {
                ans = min(ans, 1 + memo(i + step, nums, &dp))
            }
        }

        dp[i] = ans
        return ans
    }

    // =====================================================
    // 3️⃣ TABULATION (Bottom-Up DP)
    // =====================================================
    // Time: O(n^2)
    // Space: O(n)
    func jumpTabulation(_ nums: [Int]) -> Int {
        let n = nums.count
        let INF = Int.max / 2
        var dp = [Int](repeating: INF, count: n)

        // Base case: 0 jumps needed from last index
        dp[n - 1] = 0

        // Fill dp from right to left
        for i in stride(from: n - 2, through: 0, by: -1) {
            for step in 1...nums[i] where i + step < n {
                dp[i] = min(dp[i], 1 + dp[i + step])
            }
        }

        return dp[0]
    }
}
