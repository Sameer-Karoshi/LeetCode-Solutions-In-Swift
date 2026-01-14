class Solution {

    // =========================================
    // 1. RECURSIVE SOLUTION (Brute Force)
    // =========================================
    // Time: O(2^n)
    // Space: O(n) - recursion stack

    func lengthOfLIS_Recursive(_ nums: [Int]) -> Int {

        func solve(_ index: Int, _ prevIndex: Int) -> Int {

            // Base case: reached end of array
            if index == nums.count {
                return 0
            }

            // Option 1: Do not take current element
            let notTake = solve(index + 1, prevIndex)

            // Option 2: Take current element if valid
            var take = 0
            if prevIndex == -1 || nums[index] > nums[prevIndex] {
                take = 1 + solve(index + 1, index)
            }

            return max(take, notTake)
        }

        return solve(0, -1)
    }

    // =========================================
    // 2. MEMOIZATION (Top-Down DP)
    // =========================================
    // Time: O(n^2)
    // Space: O(n^2)

    func lengthOfLIS_Memo(_ nums: [Int]) -> Int {

        let n = nums.count
        // dp[index][prevIndex + 1]
        var dp = Array(repeating: Array(repeating: -1, count: n + 1), count: n)

        func solve(_ index: Int, _ prevIndex: Int) -> Int {

            // Base case
            if index == n {
                return 0
            }

            // Return stored answer if already computed
            if dp[index][prevIndex + 1] != -1 {
                return dp[index][prevIndex + 1]
            }

            // Not take
            let notTake = solve(index + 1, prevIndex)

            // Take
            var take = 0
            if prevIndex == -1 || nums[index] > nums[prevIndex] {
                take = 1 + solve(index + 1, index)
            }

            dp[index][prevIndex + 1] = max(take, notTake)
            return dp[index][prevIndex + 1]
        }

        return solve(0, -1)
    }
}
