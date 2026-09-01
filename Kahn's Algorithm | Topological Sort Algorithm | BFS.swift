class Solution {

    func topoSort(_ V: Int, _ adj: [[Int]]) -> [Int] {

        var indegree = Array(repeating: 0, count: V)

        // Calculate indegree of each node
        for node in 0..<V {
            for neighbor in adj[node] {
                indegree[neighbor] += 1
            }
        }

        var queue: [Int] = []

        // Add all nodes with indegree 0
        for node in 0..<V {
            if indegree[node] == 0 {
                queue.append(node)
            }
        }

        var result: [Int] = []

        while !queue.isEmpty {

            let node = queue.removeFirst()
            result.append(node)

            for neighbor in adj[node] {

                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return result
    }
}

/*
Kahn's Algorithm:

1. Applicable only for Directed Acyclic Graphs (DAG).

2. Indegree:
   Number of incoming edges to a node.

3. Nodes with indegree 0 can be processed first
   because no node depends on them.

4. Remove node from graph:
   - Add to answer
   - Reduce indegree of neighbors

5. When a neighbor's indegree becomes 0,
   add it to the queue.

Time Complexity: O(V + E)

Space Complexity: O(V)
- indegree array
- queue
- result array
*/
