class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var result: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] < 0 {
                    result = result + 1
                }
            }
        }
        return result
    }
}