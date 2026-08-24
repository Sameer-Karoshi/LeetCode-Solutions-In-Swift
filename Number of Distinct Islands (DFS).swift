class Solution {

    func countDistinctIslands(_ grid: [[Int]]) -> Int {

        let rows = grid.count
        let cols = grid[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        var islands = Set<String>()

        for row in 0..<rows {
            for col in 0..<cols {

                if grid[row][col] == 1 &&
                    !visited[row][col] {

                    var shape: [(Int, Int)] = []

                    dfs(
                        row,
                        col,
                        row,
                        col,
                        grid,
                        &visited,
                        &shape
                    )

                    let islandShape = shape
                        .map { "\($0.0),\($0.1)" }
                        .joined(separator: "|")

                    islands.insert(islandShape)
                }
            }
        }

        return islands.count
    }

    private func dfs(
        _ row: Int,
        _ col: Int,
        _ baseRow: Int,
        _ baseCol: Int,
        _ grid: [[Int]],
        _ visited: inout [[Bool]],
        _ shape: inout [(Int, Int)]
    ) {

        visited[row][col] = true

        // Store relative coordinates
        shape.append((row - baseRow, col - baseCol))

        let directions = [
            (-1, 0),
            (0, 1),
            (1, 0),
            (0, -1)
        ]

        for (dr, dc) in directions {

            let newRow = row + dr
            let newCol = col + dc

            if newRow >= 0 &&
                newRow < grid.count &&
                newCol >= 0 &&
                newCol < grid[0].count &&
                grid[newRow][newCol] == 1 &&
                !visited[newRow][newCol] {

                dfs(
                    newRow,
                    newCol,
                    baseRow,
                    baseCol,
                    grid,
                    &visited,
                    &shape
                )
            }
        }
    }
}

/*
Time Complexity: O(N * M)
- Every cell is visited once.

Space Complexity: O(N * M)
- Visited matrix
- DFS recursion stack
- Set storing island shapes
*/
