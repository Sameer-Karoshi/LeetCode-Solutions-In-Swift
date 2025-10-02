import Foundation

class Solution {

    /// Check if (n, m) is within bounds, not visited, and open (== 1)
    private func isSafe(_ n: Int, _ m: Int, _ maze: [[Int]], _ visited: [[Bool]], _ size: Int) -> Bool {
        return n >= 0 && n < size && m >= 0 && m < size && maze[n][m] == 1 && !visited[n][m]
    }

    /// Recursive DFS to find all paths
    private func solve(_ n: Int, _ m: Int,
                       _ maze: [[Int]], _ size: Int,
                       _ visited: inout [[Bool]],
                       _ path: inout String,
                       _ paths: inout [String]) {
        
        // Base case: destination reached
        if n == size - 1 && m == size - 1 {
            paths.append(path)
            return
        }

        // Direction deltas and corresponding moves
        let dn = [1, 0, 0, -1]         // Down, Left, Right, Up
        let dm = [0, -1, 1, 0]
        let dir = ["D", "L", "R", "U"]

        for i in 0..<4 {
            let newN = n + dn[i]
            let newM = m + dm[i]

            if isSafe(newN, newM, maze, visited, size) {
                visited[n][m] = true
                path.append(contentsOf: dir[i])

                solve(newN, newM, maze, size, &visited, &path, &paths)

                // Backtrack
                path.removeLast()
                visited[n][m] = false
            }
        }
    }

    /// Public method to return all valid paths from (0, 0) to (size-1, size-1)
    func findAllPaths(_ maze: [[Int]]) -> [String] {
        let size = maze.count
        var paths = [String]()

        if maze[0][0] == 0 || maze[size - 1][size - 1] == 0 {
            return []
        }

        var visited = Array(repeating: Array(repeating: false, count: size), count: size)
        var path = ""

        solve(0, 0, maze, size, &visited, &path, &paths)

        return paths
    }
}
