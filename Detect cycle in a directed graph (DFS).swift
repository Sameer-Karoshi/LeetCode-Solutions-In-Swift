class Solution {
    func isCyclic(_ V: Int, _ adj: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: V)
        var pathVisited = Array(repeating: false, count: V)

        for node in 0..<V {
            if !visited[node] {
                if dfs(node, adj, &visited, &pathVisited) {
                    return true
                }
            }
        }

        return false
    }

    private func dfs(
        _ node: Int,
        _ adj: [[Int]],
        _ visited: inout [Bool],
        _ pathVisited: inout [Bool]
    ) -> Bool {
        visited[node] = true
        pathVisited[node] = true

        for neighbor in adj[node] {

            if !visited[neighbor] {

                if dfs(neighbor, adj, &visited, &pathVisited) {
                    return true
                }

            } else if pathVisited[neighbor] {

                // Back edge found
                return true
            }
        }

        // Remove from current DFS path
        pathVisited[node] = false

        return false
    }
}

/*
Directed Graph Cycle Detection:

1. visited[node]
   - Node has been visited before.

2. pathVisited[node]
   - Node is part of the current DFS path.

3. Cycle exists if we reach a node that is already
   present in the current DFS path.

4. This condition represents a Back Edge.

Example:

0 → 1 → 2
    ↑   ↓
    ← ← 3

DFS Path:
0 → 1 → 2 → 3

From 3 we reach 1 again.
pathVisited[1] == true

Cycle Found.

Time Complexity: O(V + E)

Space Complexity: O(V)
- visited array
- pathVisited array
- DFS recursion stack
*/
