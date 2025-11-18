class MaximumReverseFallingPathSum {
    
    // MARK: - 1️⃣ PURE RECURSION (Start from last row)
    func solveRecursion(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        func go(_ r: Int, _ c: Int) -> Int {
            if c < 0 || c >= m { return Int.min / 2 }
            if r == 0 { return grid[r][c] }   // reached top
            
            let up = grid[r][c] + go(r - 1, c)
            let upLeft = grid[r][c] + go(r - 1, c - 1)
            let upRight = grid[r][c] + go(r - 1, c + 1)
            
            return max(up, max(upLeft, upRight))
        }
        
        var ans = Int.min
        for col in 0..<m {
            ans = max(ans, go(n - 1, col))   // start from last row
        }
        return ans
    }
    
    
    // MARK: - 2️⃣ MEMOIZATION
    func solveMemo(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        var memo = Array(
            repeating: Array(repeating: Int?.none, count: m),
            count: n
        )
        
        func go(_ r: Int, _ c: Int) -> Int {
            if c < 0 || c >= m { return Int.min / 2 }
            if r == 0 { return grid[r][c] }
            
            if let val = memo[r][c] { return val }
            
            let up = grid[r][c] + go(r - 1, c)
            let upLeft = grid[r][c] + go(r - 1, c - 1)
            let upRight = grid[r][c] + go(r - 1, c + 1)
            
            let best = max(up, max(upLeft, upRight))
            memo[r][c] = best
            return best
        }
        
        var ans = Int.min
        for col in 0..<m {
            ans = max(ans, go(n - 1, col))
        }
        return ans
    }
    
    
    // MARK: - 3️⃣ TABULATION (BOTTOM → TOP)
    func solveTabulation(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        // DP initialized same as grid
        var dp = grid
        
        for r in 1..<n {       // we move from row 1 upward to last row
            for c in 0..<m {
                
                var best = Int.min / 2
                
                // ↑ Up
                best = max(best, dp[r - 1][c])
                
                // ↖ Up-left
                if c - 1 >= 0 {
                    best = max(best, dp[r - 1][c - 1])
                }
                
                // ↗ Up-right
                if c + 1 < m {
                    best = max(best, dp[r - 1][c + 1])
                }
                
                dp[r][c] += best
            }
        }
        
        return dp[n - 1].max()!
    }
    
    
    // MARK: - 4️⃣ SPACE OPTIMIZATION (ONLY 1 ROW)
    func solveSpaceOpt(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        var prev = grid[0]                    // top row
        var curr = Array(repeating: 0, count: m)
        
        for r in 1..<n {                      // move downward in DP means upward in logic
            for c in 0..<m {
                
                var best = Int.min / 2
                
                best = max(best, prev[c])
                
                if c - 1 >= 0 {
                    best = max(best, prev[c - 1])
                }
                if c + 1 < m {
                    best = max(best, prev[c + 1])
                }
                
                curr[c] = grid[r][c] + best
            }
            prev = curr
        }
        
        return prev.max()!
    }
}
