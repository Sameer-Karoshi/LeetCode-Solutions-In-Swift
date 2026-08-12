class Solution {

    func numIslands(_ grid: [[Character]]) -> Int {

        let rows = grid.count
        let cols = grid[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        var count = 0

        for row in 0..<rows {
            for col in 0..<cols {

                // "1" = land
                if grid[row][col] == "1" && !visited[row][col] {
                    count += 1
                    dfs(row, col, grid, &visited)
                }
            }
        }

        return count
    }

    private func dfs(
        _ row: Int,
        _ col: Int,
        _ grid: [[Character]],
        _ visited: inout [[Bool]]
    ) {

        visited[row][col] = true

        // 8 directions
        let directions = [
            (-1, -1), (-1, 0), (-1, 1),  // Top
            (0, -1),           (0, 1),   // Left, Right
            (1, -1),  (1, 0),  (1, 1)   // Bottom
        ]

        for (dr, dc) in directions {

            let newRow = row + dr
            let newCol = col + dc

            if newRow >= 0 &&
               newRow < grid.count &&
               newCol >= 0 &&
               newCol < grid[0].count &&
               grid[newRow][newCol] == "1" &&
               !visited[newRow][newCol] {

                dfs(newRow, newCol, grid, &visited)
            }
        }
    }
}

/*
Time Complexity: O(N × M)
- Every cell is visited at most once.
- 8 directions is constant.

Space Complexity: O(N × M)
- visited array
- DFS recursion stack
*/
