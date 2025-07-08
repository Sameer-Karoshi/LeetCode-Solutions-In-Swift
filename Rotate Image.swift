class Solution {
    // brute force
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var resultMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)

        for i in 0..<n {
            var temp = [Int](repeating: 0, count: n)
            for j in 0..<n {
                temp[j] = matrix[j][i]
            }
            resultMatrix[i] = temp.reversed()
        }

        matrix = resultMatrix
    }

    // Optimized
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // take the transpose of matrix
        for i in 0..<n - 1{
            for j in (i+1)..<n {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        // reverse every row
        for i in 0..<n {
            matrix[i] = matrix[i].reversed()
        }
    }
}
