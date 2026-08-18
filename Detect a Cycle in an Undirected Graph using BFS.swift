class Solution {
    func isCycle(_ V: Int, _ adj: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: V)
        for node in 0..<V {
            if !visited[node] {
                if bfs(node, adj, &visited) {
                    return true
                }
            }
        }

        return false
    }

    private func bfs(
        _ startNode: Int,
        _ adj: [[Int]],
        _ visited: inout [Bool]
    ) -> Bool {
        var queue: [(node: Int, parent: Int)] = []

        queue.append((startNode, -1))
        visited[startNode] = true

        while !queue.isEmpty {

            let (node, parent) = queue.removeFirst()
            for neighbor in adj[node] {
                if !visited[neighbor] {
                    visited[neighbor] = true
                    queue.append((neighbor, node))

                } else if neighbor != parent {
                    return true
                }
            }
        }

        return false
    }
}

/*
Time Complexity: O(V + 2E)
- Every vertex is visited once.
- In an undirected graph, every edge appears twice
  in the adjacency list.

Simplified Big-O: O(V + E)

Space Complexity: O(V)
- Visited array
- Queue in worst case
*/
