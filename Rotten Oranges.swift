class Solution {

    func orangesRotting(_ grid: [[Int]]) -> Int {

        let rows = grid.count
        let cols = grid[0].count

        var queue: [(Int, Int, Int)] = [] // row, col, time
        var visited = grid

        var freshOranges = 0
        var maxTime = 0

        for row in 0..<rows {
            for col in 0..<cols {

                if grid[row][col] == 2 {
                    queue.append((row, col, 0))
                }

                if grid[row][col] == 1 {
                    freshOranges += 1
                }
            }
        }

        let directions = [
            (-1, 0), // Up
            (0, 1),  // Right
            (1, 0),  // Down
            (0, -1)  // Left
        ]

        while !queue.isEmpty {

            let (row, col, time) = queue.removeFirst()

            maxTime = max(maxTime, time)

            for (dr, dc) in directions {

                let newRow = row + dr
                let newCol = col + dc

                if newRow >= 0 &&
                    newRow < rows &&
                    newCol >= 0 &&
                    newCol < cols &&
                    grid[newRow][newCol] == 1 &&
                    visited[newRow][newCol] != 2 {

                    visited[newRow][newCol] = 2
                    freshOranges -= 1

                    queue.append((newRow, newCol, time + 1))
                }
            }
        }

        return freshOranges == 0 ? maxTime : -1
    }
}

/*
Time Complexity: O(N * M)

Space Complexity: O(N * M)
- Visited matrix
- Queue
*/
