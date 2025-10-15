class Solution {
    
    // MARK: 1️⃣ Recursive (Brute Force)
    // Time: O(2^(m+n)), Space: O(m+n) stack space
    func minPathSumRecursive(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        
        func minPath(_ row: Int, _ col: Int) -> Int {
            // Out of bounds
            if row < 0 || col < 0 {
                return Int.max
            }
            // Base case: starting cell
            if row == 0 && col == 0 {
                return grid[0][0]
            }
            // Recursive calls
            let up = grid[row][col] + minPath(row - 1, col)
            let left = grid[row][col] + minPath(row, col - 1)
            return min(up, left)
        }
        
        return minPath(m - 1, n - 1)
    }

    
    // MARK: 2️⃣ Memoization (Top-Down DP)
    // Time: O(m * n), Space: O(m * n) + stack space
    func minPathSumMemo(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        func minPath(_ row: Int, _ col: Int) -> Int {
            // Out of bounds
            if row < 0 || col < 0 {
                return Int.max
            }
            // Base case
            if row == 0 && col == 0 {
                return grid[0][0]
            }
            // Return memoized result if available
            if memo[row][col] != -1 {
                return memo[row][col]
            }
            // Recursive calls
            let up = grid[row][col] + minPath(row - 1, col)
            let left = grid[row][col] + minPath(row, col - 1)
            memo[row][col] = min(up, left)
            return memo[row][col]
        }
        
        return minPath(m - 1, n - 1)
    }

    
    // MARK: 3️⃣ Tabulation (Bottom-Up DP)
    // Time: O(m * n), Space: O(m * n)
    func minPathSumTabulation(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for row in 0..<m {
            for col in 0..<n {
                if row == 0 && col == 0 {
                    // Starting cell
                    dp[row][col] = grid[0][0]
                } else {
                    // Take min from top and left
                    let up = row > 0 ? grid[row][col] + dp[row - 1][col] : Int.max
                    let left = col > 0 ? grid[row][col] + dp[row][col - 1] : Int.max
                    dp[row][col] = min(up, left)
                }
            }
        }
        
        return dp[m - 1][n - 1]
    }

    
    // MARK: 4️⃣ Space Optimized DP
    // Time: O(m * n), Space: O(n)
    func minPathSumSpaceOptimized(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var prevRow = Array(repeating: Int.max, count: n)
        
        for row in 0..<m {
            var currentRow = Array(repeating: 0, count: n)
            for col in 0..<n {
                if row == 0 && col == 0 {
                    // Starting cell
                    currentRow[col] = grid[0][0]
                } else {
                    // From top and left
                    let up = row > 0 ? grid[row][col] + prevRow[col] : Int.max
                    let left = col > 0 ? grid[row][col] + currentRow[col - 1] : Int.max
                    currentRow[col] = min(up, left)
                }
            }
            prevRow = currentRow
        }
        
        return prevRow[n - 1]
    }
}
