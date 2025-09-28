class Solution {
    // Public function to solve the Sudoku board using backtracking
    func solveSudoku(_ board: inout [[Character]]) {
        _ = backtrack(&board)
    }

    // Recursive backtracking function
    private func backtrack(_ board: inout [[Character]]) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                // If the current cell is empty, try placing digits 1-9
                if board[row][col] == "." {
                    for char in "123456789" {
                        if isValid(board: &board, row: row, col: col, char) {
                            board[row][col] = char

                            // Recurse: if the board is solved, return true
                            if backtrack(&board) {
                                return true
                            }

                            // If not valid later, reset the cell and backtrack
                            board[row][col] = "."
                        }
                    }

                    // If no valid number found, return false to trigger backtracking
                    return false
                }
            }
        }

        // If no empty cell is left, the board is solved
        return true
    }

    /// Checks if placing character `c` at (row, col) is valid
    private func isValid(board: inout [[Character]], row: Int, col: Int, _ c: Character) -> Bool {
        let startRow = (row / 3) * 3
        let startCol = (col / 3) * 3

        for i in 0..<9 {
            // Check row
            if board[row][i] == c {
                return false
            }

            // Check column
            if board[i][col] == c {
                return false
            }

            // Check 3x3 subgrid
            let subgridRow = startRow + i / 3
            let subgridCol = startCol + i % 3
            if board[subgridRow][subgridCol] == c {
                return false
            }
        }

        return true
    }
}
