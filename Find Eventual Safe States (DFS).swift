class Solution {

    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {

        let V = graph.count

        var visited = Array(repeating: false, count: V)
        var pathVisited = Array(repeating: false, count: V)
        var safe = Array(repeating: false, count: V)

        for node in 0..<V {
            if !visited[node] {
                dfs(
                    node,
                    graph,
                    &visited,
                    &pathVisited,
                    &safe
                )
            }
        }

        var result: [Int] = []

        for node in 0..<V {
            if safe[node] {
                result.append(node)
            }
        }

        return result
    }

    private func dfs(
        _ node: Int,
        _ graph: [[Int]],
        _ visited: inout [Bool],
        _ pathVisited: inout [Bool],
        _ safe: inout [Bool]
    ) -> Bool {

        visited[node] = true
        pathVisited[node] = true

        for neighbor in graph[node] {

            if !visited[neighbor] {

                if dfs(
                    neighbor,
                    graph,
                    &visited,
                    &pathVisited,
                    &safe
                ) {
                    return true
                }

            } else if pathVisited[neighbor] {

                return true
            }
        }

        pathVisited[node] = false
        safe[node] = true

        return false
    }
}

/*
Eventual Safe State:
A node is safe if every possible path starting
from it eventually ends at a terminal node.

Cycle Nodes -> Unsafe
Nodes leading to Cycle -> Unsafe
Remaining Nodes -> Safe

Time Complexity: O(V + E)

Space Complexity: O(V)
- visited array
- pathVisited array
- safe array
- DFS recursion stack
*/
