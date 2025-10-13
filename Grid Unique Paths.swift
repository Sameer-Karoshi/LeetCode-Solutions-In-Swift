class Solution {
    
    // MARK: 1️⃣ Recursive (Brute Force) - Exponential Time
    // Time: O(2^(m+n)), Space: O(m+n) stack space
    func uniquePathsRecursive(_ m: Int, _ n: Int) -> Int {
        func countPaths(_ i: Int, _ j: Int) -> Int {
            // Base case: Reached the start
            if i == 0 && j == 0 {
                return 1
            }
            // Out of bounds
            if i < 0 || j < 0 {
                return 0
            }
            // Recursive calls: from top and left
            return countPaths(i - 1, j) + countPaths(i, j - 1)
        }
        return countPaths(m - 1, n - 1)
    }
    
    
    // MARK: 2️⃣ Memoization (Top-Down DP) - Optimal Recursive
    // Time: O(m * n), Space: O(m * n) + stack space
    func uniquePathsMemo(_ m: Int, _ n: Int) -> Int {
        // 2D array for memoization
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        func countPaths(_ i: Int, _ j: Int) -> Int {
            // Base case
            if i == 0 && j == 0 {
                return 1
            }
            if i < 0 || j < 0 {
                return 0
            }
            // Return memoized result
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            // Store result in memo
            memo[i][j] = countPaths(i - 1, j) + countPaths(i, j - 1)
            return memo[i][j]
        }
        
        return countPaths(m - 1, n - 1)
    }
    
    
    // MARK: 3️⃣ Tabulation (Bottom-Up DP)
    // Time: O(m * n), Space: O(m * n)
    func uniquePathsTabulation(_ m: Int, _ n: Int) -> Int {
        // Create DP table
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    // First row or first column has only 1 way
                    dp[i][j] = 1
                } else {
                    // From top + from left
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        
        return dp[m - 1][n - 1]
    }
    
    
    // MARK: 4️⃣ Space Optimized DP
    // Time: O(m * n), Space: O(n)
    func uniquePathsSpaceOptimized(_ m: Int, _ n: Int) -> Int {
        // Use 1D array to hold previous row
        var prev = Array(repeating: 1, count: n)
        
        for _ in 1..<m {
            var curr = Array(repeating: 1, count: n)
            for j in 1..<n {
                curr[j] = curr[j - 1] + prev[j]
            }
            prev = curr
        }
        
        return prev[n - 1]
    }
}
