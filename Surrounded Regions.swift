class Solution {

    func solve(_ board: inout [[Character]]) {

        let rows = board.count
        let cols = board[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        // Up, Right, Down, Left
        let directions = [
            (-1, 0),
            (0, 1),
            (1, 0),
            (0, -1)
        ]

        // First column and last column
        for row in 0..<rows {

            if board[row][0] == "O" && !visited[row][0] {
                dfs(row, 0, board, &visited, directions)
            }

            if board[row][cols - 1] == "O" && !visited[row][cols - 1] {
                dfs(row, cols - 1, board, &visited, directions)
            }
        }

        // First row and last row
        for col in 0..<cols {

            if board[0][col] == "O" && !visited[0][col] {
                dfs(0, col, board, &visited, directions)
            }

            if board[rows - 1][col] == "O" && !visited[rows - 1][col] {
                dfs(rows - 1, col, board, &visited, directions)
            }
        }

        // Convert all unvisited O's to X
        for row in 0..<rows {
            for col in 0..<cols {

                if board[row][col] == "O" &&
                    !visited[row][col] {

                    board[row][col] = "X"
                }
            }
        }
    }

    private func dfs(
        _ row: Int,
        _ col: Int,
        _ board: [[Character]],
        _ visited: inout [[Bool]],
        _ directions: [(Int, Int)]
    ) {

        visited[row][col] = true

        for (dr, dc) in directions {

            let newRow = row + dr
            let newCol = col + dc

            if newRow >= 0 &&
                newRow < board.count &&
                newCol >= 0 &&
                newCol < board[0].count &&
                board[newRow][newCol] == "O" &&
                !visited[newRow][newCol] {

                dfs(newRow, newCol, board, &visited, directions)
            }
        }
    }
}

/*
Time Complexity: O(N * M)
- Every cell is visited at most once.

Space Complexity: O(N * M)
- Visited matrix
- DFS recursion stack
*/
