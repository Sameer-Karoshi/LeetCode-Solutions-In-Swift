class Solution {
    
    // MARK: - 1. Recursion (No Memoization)
    func frogJumpRecursion(_ heights: [Int], _ index: Int, _ k: Int) -> Int {
        if index == 0 { return 0 }
        
        var minCost = Int.max
        for j in 1...k {
            if index - j >= 0 {
                let cost = frogJumpRecursion(heights, index - j, k) + abs(heights[index] - heights[index - j])
                minCost = min(minCost, cost)
            }
        }
        return minCost
    }

    // MARK: - 2. Memoization (Top-Down DP)
    func frogJumpMemo(_ heights: [Int], _ index: Int, _ k: Int, _ dp: inout [Int]) -> Int {
        if index == 0 { return 0 }
        if dp[index] != -1 { return dp[index] }

        var minCost = Int.max
        for j in 1...k {
            if index - j >= 0 {
                let cost = frogJumpMemo(heights, index - j, k, &dp) + abs(heights[index] - heights[index - j])
                minCost = min(minCost, cost)
            }
        }

        dp[index] = minCost
        return dp[index]
    }

    // MARK: - 3. Tabulation (Bottom-Up DP)
    func frogJumpTabulation(_ heights: [Int], _ k: Int) -> Int {
        let n = heights.count
        if n == 0 { return 0 }

        var dp = [Int](repeating: Int.max, count: n)
        dp[0] = 0

        for i in 1..<n {
            for j in 1...k {
                if i - j >= 0 {
                    let cost = dp[i - j] + abs(heights[i] - heights[i - j])
                    dp[i] = min(dp[i], cost)
                }
            }
        }

        return dp[n - 1]
    }
}
