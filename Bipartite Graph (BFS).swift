class Solution {

    func isBipartite(_ graph: [[Int]]) -> Bool {
        let V = graph.count
        var color = Array(repeating: -1, count: V)

        for node in 0..<V {
            if color[node] == -1 {
                if !bfs(node, graph, &color) {
                    return false
                }
            }
        }

        return true
    }

    private func bfs(
        _ startNode: Int,
        _ graph: [[Int]],
        _ color: inout [Int]
    ) -> Bool {

        var queue: [Int] = []

        queue.append(startNode)
        color[startNode] = 0

        while !queue.isEmpty {
            let node = queue.removeFirst()

            for neighbor in graph[node] {

                if color[neighbor] == -1 {

                    // Assign opposite color
                    color[neighbor] = 1 - color[node]
                    queue.append(neighbor)

                } else if color[neighbor] == color[node] {

                    // Same color on adjacent nodes
                    return false
                }
            }
        }

        return true
    }
}

/*
Properties of Bipartite Graph:

1. A graph is Bipartite if it can be colored using only
   2 colors such that no two adjacent nodes have the same color.

2. Even Length Cycle -> Bipartite

3. Odd Length Cycle -> Not Bipartite

4. Tree (No Cycle) -> Always Bipartite

Interview One-Liner:
A graph is Bipartite if and only if it does not contain
an odd-length cycle.

Time Complexity: O(V + 2E)
- Every vertex is visited once.
- In an undirected graph, every edge appears twice.

Simplified Big-O: O(V + E)

Space Complexity: O(V)
- Color array
- Queue
*/
