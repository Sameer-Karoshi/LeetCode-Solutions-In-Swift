import Foundation

class Solution {
    
    // MARK: - 1. Recursive (Brute-force)
    func maxSumRecursive(_ nums: [Int]) -> Int {
        return solveRecursive(nums, nums.count - 1)
    }
    
    private func solveRecursive(_ nums: [Int], _ index: Int) -> Int {
        if index == 0 { return nums[0] }
        if index < 0 { return 0 }

        // Option 1: Pick current element and move 2 steps back
        let pick = nums[index] + solveRecursive(nums, index - 2)

        // Option 2: Skip current element and move 1 step back
        let notPick = solveRecursive(nums, index - 1)

        return max(pick, notPick)
    }
    
    // MARK: - 2. Memoization (Top-Down DP)
    func maxSumMemoization(_ nums: [Int]) -> Int {
        var dp = Array(repeating: -1, count: nums.count)
        return solveMemo(nums, nums.count - 1, &dp)
    }

    private func solveMemo(_ nums: [Int], _ index: Int, _ dp: inout [Int]) -> Int {
        if index == 0 { return nums[0] }
        if index < 0 { return 0 }
        if dp[index] != -1 { return dp[index] }

        let pick = nums[index] + solveMemo(nums, index - 2, &dp)
        let notPick = solveMemo(nums, index - 1, &dp)

        dp[index] = max(pick, notPick)
        return dp[index]
    }
    
    // MARK: - 3. Tabulation (Bottom-Up DP)
    func maxSumTabulation(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }

        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<n {
            let pick = nums[i] + dp[i - 2]
            let notPick = dp[i - 1]
            dp[i] = max(pick, notPick)
        }

        return dp[n - 1]
    }
    
    // MARK: - 4. Space Optimization (O(1) Space)
    func maxSumSpaceOptimized(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }

        var prev1 = nums[0] // dp[i - 1]
        var prev2 = 0       // dp[i - 2]

        for i in 1..<n {
            let pick = nums[i] + prev2
            let notPick = prev1
            let curr = max(pick, notPick)
            
            // Slide the window forward
            prev2 = prev1
            prev1 = curr
        }

        return prev1
    }
}
