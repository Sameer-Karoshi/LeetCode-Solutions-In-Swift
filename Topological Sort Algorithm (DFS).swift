class Solution {

    func topoSort(_ V: Int, _ adj: [[Int]]) -> [Int] {

        var visited = Array(repeating: false, count: V)
        var stack: [Int] = []

        for node in 0..<V {
            if !visited[node] {
                dfs(node, adj, &visited, &stack)
            }
        }

        return stack.reversed()
    }

    private func dfs(
        _ node: Int,
        _ adj: [[Int]],
        _ visited: inout [Bool],
        _ stack: inout [Int]
    ) {

        visited[node] = true

        for neighbor in adj[node] {
            if !visited[neighbor] {
                dfs(neighbor, adj, &visited, &stack)
            }
        }

        // Add node after visiting all neighbors
        stack.append(node)
    }
}

/*
Topological Sort:

1. Applicable only for Directed Acyclic Graphs (DAG).

2. If there is an edge:
   u -> v

   Then u must appear before v
   in the topological ordering.

3. DFS Approach:
   - Visit all neighbors first.
   - Push current node into stack.
   - Reverse stack to get answer.

Time Complexity: O(V + E)

Space Complexity: O(V)
- visited array
- recursion stack
- result stack
*/
