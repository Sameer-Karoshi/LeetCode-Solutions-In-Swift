class Solution {

    func nearest(_ grid: [[Int]]) -> [[Int]] {

        let rows = grid.count
        let cols = grid[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        var distance = Array(
            repeating: Array(repeating: 0, count: cols),
            count: rows
        )

        var queue: [(Int, Int, Int)] = [] // row, col, distance

        // Add all cells containing 1 to queue
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    queue.append((row, col, 0))
                    visited[row][col] = true
                }
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

            let (row, col, dist) = queue.removeFirst()

            // Store shortest distance
            distance[row][col] = dist

            for (dr, dc) in directions {

                let newRow = row + dr
                let newCol = col + dc

                if newRow >= 0 &&
                    newRow < rows &&
                    newCol >= 0 &&
                    newCol < cols &&
                    !visited[newRow][newCol] {

                    visited[newRow][newCol] = true
                    queue.append((newRow, newCol, dist + 1))
                }
            }
        }

        return distance
    }
}

/*
Time Complexity: O(N * M)
- Every cell is visited at most once.

Space Complexity: O(N * M)
- Visited matrix
- Distance matrix
- Queue
*/
