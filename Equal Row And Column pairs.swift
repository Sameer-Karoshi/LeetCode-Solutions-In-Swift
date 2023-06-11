class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var columnArray = [[Int]]()
        var result = 0
        for i in 0..<grid.count{
            var col = [Int]()
            for j in 0..<grid.count{
                col.append(grid[j][i])
            }
            columnArray.append(col)
        }

        print(columnArray)
        for i in grid {
            for j in columnArray {
                if i == j {
                    result += 1
                } 
            }
        }
        return result
    }
}