class Solution {

    // ---------------------------------------------------------
    // 1️⃣ PURE RECURSION
    // TC = O(2^N)     SC = O(N)
    // ---------------------------------------------------------
    func minimumTotal_recursion(_ triangle: [[Int]]) -> Int {
        return solveRec(triangle, 0, 0)
    }
    
    private func solveRec(_ t: [[Int]], _ row: Int, _ col: Int) -> Int {
        if row == t.count - 1 {
            return t[row][col]
        }
        
        let down = t[row][col] + solveRec(t, row + 1, col)
        let diagonal = t[row][col] + solveRec(t, row + 1, col + 1)
        return min(down, diagonal)
    }
    

    // ---------------------------------------------------------
    // 2️⃣ MEMOIZATION (TOP-DOWN DP)
    // TC = O(N²)     SC = O(N²)
    // ---------------------------------------------------------
    func minimumTotal_memo(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = Array(repeating: Array(repeating: -1, count: n), count: n)
        return solveMemo(triangle, 0, 0, &dp)
    }
    
    private func solveMemo(_ t: [[Int]], _ row: Int, _ col: Int, _ dp: inout [[Int]]) -> Int {
        if row == t.count - 1 {
            return t[row][col]
        }
        
        if dp[row][col] != -1 {
            return dp[row][col]
        }
        
        let down = t[row][col] + solveMemo(t, row + 1, col, &dp)
        let diagonal = t[row][col] + solveMemo(t, row + 1, col + 1, &dp)
        dp[row][col] = min(down, diagonal)
        return dp[row][col]
    }


    // ---------------------------------------------------------
    // 3️⃣ TABULATION (BOTTOM-UP DP)
    // TC = O(N²)     SC = O(N²)
    // ---------------------------------------------------------
    func minimumTotal_tabulation(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle
        
        for row in stride(from: n - 2, through: 0, by: -1) {
            for col in stride(from: row, through: 0, by: -1) {
                let down = dp[row + 1][col]
                let diagonal = dp[row + 1][col + 1]
                dp[row][col] += min(down, diagonal)
            }
        }
        
        return dp[0][0]
    }


    // ---------------------------------------------------------
    // 4️⃣ SPACE-OPTIMIZED DP (BEST METHOD)
    // TC = O(N²)     SC = O(N)
    // ---------------------------------------------------------
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle[n - 1]
        
        for row in stride(from: n - 2, through: 0, by: -1) {
            var currentRow = Array(repeating: 0, count: row + 1)
            
            for col in stride(from: row, through: 0, by: -1) {
                let down = dp[col]
                let diagonal = dp[col + 1]
                currentRow[col] = triangle[row][col] + min(down, diagonal)
            }
            
            dp = currentRow
        }
        
        return dp[0]
    }
}
