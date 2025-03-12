class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row: [Int] = []
        var result = 1 
        for i in 0...rowIndex {
            if i == 0 || i == rowIndex {
                row.append(1)
            } else {
                result = result * ((rowIndex+1) - i)
                result = result / i
                row.append(result)
            }
        }

        return row
    }
}
