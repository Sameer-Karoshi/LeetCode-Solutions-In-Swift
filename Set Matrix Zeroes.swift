class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        // Optimal Solution in Swift
        // col[m] = matrix[m][..]
        // row[n] = matrix[..][n]

        // Iterate over the matrix and mark 0th row / column as 0
        // extra var for intersection point
        var col0 = 1
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    // mark the i-th row
                    matrix[i][0] = 0

                    // mark the j-th column
                    if j != 0 {
                        matrix[0][j] = 0
                    } else {
                        col0 = 0
                    }
                }
            }
        }

        // now mark the matrix as 0 expect 1st row and column
        for i in 1..<matrix.count {
            for j in 1..<matrix[i].count {
                if matrix[i][j] != 0 {
                    // check for col and row
                    if matrix[0][j] == 0 || matrix[i][0] == 0 {
                        matrix[i][j] = 0
                    }
                }
            }
        }

        if matrix[0][0] == 0 {
            for j in 0..<matrix[0].count {
                matrix[0][j] = 0
            }
        }

        if col0 == 0 {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}
