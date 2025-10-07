class Solution {
    
    // MARK: - 1. Recursion (No Memoization)
    func frogJumpRecursion(_ heights: [Int], _ index: Int) -> Int {
        if index == 0 { return 0 }

        let jumpOne = frogJumpRecursion(heights, index - 1) + abs(heights[index] - heights[index - 1])
        
        var jumpTwo = Int.max
        if index > 1 {
            jumpTwo = frogJumpRecursion(heights, index - 2) + abs(heights[index] - heights[index - 2])
        }
        
        return min(jumpOne, jumpTwo)
    }

    // MARK: - 2. Memoization (Top-Down DP)
    func frogJumpMemo(_ heights: [Int], _ index: Int, _ dp: inout [Int]) -> Int {
        if index == 0 { return 0 }
        if dp[index] != -1 { return dp[index] }

        let jumpOne = frogJumpMemo(heights, index - 1, &dp) + abs(heights[index] - heights[index - 1])
        
        var jumpTwo = Int.max
        if index > 1 {
            jumpTwo = frogJumpMemo(heights, index - 2, &dp) + abs(heights[index] - heights[index - 2])
        }

        dp[index] = min(jumpOne, jumpTwo)
        return dp[index]
    }

    // MARK: - 3. Tabulation (Bottom-Up DP)
    func frogJumpTabulation(_ heights: [Int]) -> Int {
        let n = heights.count
        if n == 0 { return 0 }

        var dp = [Int](repeating: 0, count: n)
        dp[0] = 0

        for i in 1..<n {
            let jumpOne = dp[i - 1] + abs(heights[i] - heights[i - 1])
            var jumpTwo = Int.max
            if i > 1 {
                jumpTwo = dp[i - 2] + abs(heights[i] - heights[i - 2])
            }
            dp[i] = min(jumpOne, jumpTwo)
        }

        return dp[n - 1]
    }

    // MARK: - 4. Space Optimized Version
    func frogJumpSpaceOptimized(_ heights: [Int]) -> Int {
        let n = heights.count
        if n == 0 { return 0 }

        var prev = 0       // dp[i - 1]
        var prev2 = 0      // dp[i - 2]

        for i in 1..<n {
            let jumpOne = prev + abs(heights[i] - heights[i - 1])
            var jumpTwo = Int.max
            if i > 1 {
                jumpTwo = prev2 + abs(heights[i] - heights[i - 2])
            }

            let current = min(jumpOne, jumpTwo)
            prev2 = prev
            prev = current
        }

        return prev
    }
}
