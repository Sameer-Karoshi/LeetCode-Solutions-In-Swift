class Solution {

    func numEnclaves(_ grid: [[Int]]) -> Int {

        let rows = grid.count
        let cols = grid[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        var queue: [(Int, Int)] = []

        // First column and last column
        for row in 0..<rows {

            if grid[row][0] == 1 {
                queue.append((row, 0))
                visited[row][0] = true
            }

            if grid[row][cols - 1] == 1 {
                queue.append((row, cols - 1))
                visited[row][cols - 1] = true
            }
        }

        // First row and last row
        for col in 0..<cols {

            if grid[0][col] == 1 && !visited[0][col] {
                queue.append((0, col))
                visited[0][col] = true
            }

            if grid[rows - 1][col] == 1 &&
                !visited[rows - 1][col] {

                queue.append((rows - 1, col))
                visited[rows - 1][col] = true
            }
        }

        // Up, Right, Down, Left
        let directions = [
            (-1, 0),
            (0, 1),
            (1, 0),
            (0, -1)
        ]

        while !queue.isEmpty {

            let (row, col) = queue.removeFirst()

            for (dr, dc) in directions {

                let newRow = row + dr
                let newCol = col + dc

                if newRow >= 0 &&
                    newRow < rows &&
                    newCol >= 0 &&
                    newCol < cols &&
                    grid[newRow][newCol] == 1 &&
                    !visited[newRow][newCol] {

                    visited[newRow][newCol] = true
                    queue.append((newRow, newCol))
                }
            }
        }

        var count = 0

        // Count unvisited land cells
        for row in 0..<rows {
            for col in 0..<cols {

                if grid[row][col] == 1 &&
                    !visited[row][col] {

                    count += 1
                }
            }
        }

        return count
    }
}

/*
Time Complexity: O(N * M)
- Every cell is visited at most once.

Space Complexity: O(N * M)
- Visited matrix
- Queue
*/
