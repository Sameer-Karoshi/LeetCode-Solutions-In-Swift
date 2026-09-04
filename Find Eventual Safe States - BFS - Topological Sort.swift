class Solution {

    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {

        let V = graph.count

        var reversedGraph = Array(
            repeating: [Int](),
            count: V
        )

        var indegree = Array(
            repeating: 0,
            count: V
        )

        // Reverse all edges
        for node in 0..<V {

            for neighbor in graph[node] {

                reversedGraph[neighbor].append(node)
                indegree[node] += 1
            }
        }

        var queue: [Int] = []

        // Add nodes with indegree 0
        for node in 0..<V {

            if indegree[node] == 0 {
                queue.append(node)
            }
        }

        var safeNodes: [Int] = []

        while !queue.isEmpty {

            let node = queue.removeFirst()

            safeNodes.append(node)

            for neighbor in reversedGraph[node] {

                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return safeNodes.sorted()
    }
}

/*
Terminal Node:
A node having no outgoing edges.

Safe Node:
A node from which every path
eventually reaches a terminal node.

Approach:
1. Reverse graph.
2. Apply Kahn's Algorithm.
3. Nodes processed by BFS are safe.

Why reverse graph?

Original:
0 -> 1 -> 2

Reversed:
0 <- 1 <- 2

Terminal nodes become source nodes
(indegree = 0).

Cycle nodes never reach indegree 0,
so they are automatically excluded.

Time Complexity: O(V + E)

Space Complexity: O(V + E)
- Reversed graph
- Indegree array
- Queue
*/
