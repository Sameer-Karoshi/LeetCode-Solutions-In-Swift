class Solution {

    func dfsOfGraph(_ V: Int, _ adj: [[Int]]) -> [Int] {
        var visited = Array(repeating: false, count: V)
        var result: [Int] = []

        dfs(0, adj, &visited, &result)

        return result
    }

    private func dfs(_ node: Int,
                     _ adj: [[Int]],
                     _ visited: inout [Bool],
                     _ result: inout [Int]) {

        visited[node] = true
        result.append(node)

        for neighbor in adj[node] {
            if !visited[neighbor] {
                dfs(neighbor, adj, &visited, &result)
            }
        }
    }
}

/*
Time Complexity: O(V + E)
- Every vertex visited once
- Every edge explored once

Space Complexity: O(V)
- Visited array: O(V)
- Recursion stack: O(V) in worst case
*/
