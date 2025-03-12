class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        // B[i] = A[i] + A[i-1] (Non Edge)

        var pascalTriangleArray: [[Int]] = []
        for i in 1...numRows {
            var row: [Int] = []
            for j in 0..<i {
                if j == 0 || j == i - 1 {
                    row.append(1)
                } else {
                    row.append(pascalTriangleArray[i-2][j] + pascalTriangleArray[i-2][j-1])
                }
            }

            pascalTriangleArray.append(row)
        }

        return pascalTriangleArray
    }
}
