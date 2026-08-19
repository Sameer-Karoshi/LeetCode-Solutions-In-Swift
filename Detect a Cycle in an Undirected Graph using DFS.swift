class Solution {

    func isCycle(_ V: Int, _ adj: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: V)

        for node in 0..<V {
            if !visited[node] {
                if dfs(node, -1, adj, &visited) {
                    return true
                }
            }
        }

        return false
    }

    private func dfs(
        _ node: Int,
        _ parent: Int,
        _ adj: [[Int]],
        _ visited: inout [Bool]
    ) -> Bool {

        visited[node] = true

        for neighbor in adj[node] {
            if !visited[neighbor] {
                if dfs(neighbor, node, adj, &visited) {
                    return true
                }
            } else if neighbor != parent {
                return true
            }
        }

        return false
    }
}

/*
Time Complexity: O(V + 2E)
- Every vertex is visited once.
- In an undirected graph, every edge appears twice.

Simplified Big-O: O(V + E)

Space Complexity: O(V)
- Visited array: O(V)
- Recursion stack: O(V)
*/
