class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        var result: [[String]] = []
        solve(col: 0, board: &board, result: &result, n: n)
        return result
    }

    private func solve(col: Int, board: inout [[String]], result: inout [[String]], n: Int) {
        if col == n {
            result.append(board.map { $0.joined() })
            return
        }

        for row in 0..<n {
            if isSafeToInsert(row: row, col: col, board: board, n: n) {
                board[row][col] = "Q"
                solve(col: col + 1, board: &board, result: &result, n: n)
                board[row][col] = "."
            }
        }
    }

    private func isSafeToInsert(row: Int, col: Int, board: [[String]], n: Int) -> Bool {
        var dupRow = row, dupCol = col

        while dupRow >= 0 && dupCol >= 0 {
            if board[dupRow][dupCol] == "Q" { return false }
            dupRow -= 1; dupCol -= 1
        }

        dupCol = col; dupRow = row
        while dupCol >= 0 {
            if board[dupRow][dupCol] == "Q" { return false }
            dupCol -= 1
        }

        dupCol = col; dupRow = row
        while dupRow < n && dupCol >= 0 {
            if board[dupRow][dupCol] == "Q" { return false }
            dupRow += 1; dupCol -= 1
        }

        return true
    }
}
