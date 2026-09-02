class Solution {

    func isCyclic(_ V: Int, _ adj: [[Int]]) -> Bool {

        var indegree = Array(repeating: 0, count: V)

        // Calculate indegree
        for node in 0..<V {
            for neighbor in adj[node] {
                indegree[neighbor] += 1
            }
        }

        var queue: [Int] = []

        // Add nodes with indegree 0
        for node in 0..<V {
            if indegree[node] == 0 {
                queue.append(node)
            }
        }

        var count = 0

        while !queue.isEmpty {

            let node = queue.removeFirst()
            count += 1

            for neighbor in adj[node] {

                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        // If all nodes are processed, no cycle
        return count != V
    }
}

/*
Directed Graph Cycle Detection using Kahn's Algorithm

1. Calculate indegree of every node.

2. Add all nodes having indegree 0
   into the queue.

3. Process nodes using BFS.

4. Every processed node removes its
   outgoing edges, reducing indegree
   of its neighbors.

5. If a neighbor's indegree becomes 0,
   add it to the queue.

6. If all V nodes are processed:
   -> No Cycle

7. If fewer than V nodes are processed:
   -> Cycle Exists

Why?

A cycle prevents some nodes from ever
reaching indegree 0.

Example:

0 → 1 → 2
↑       ↓
└───────┘

Indegree:
0 = 1
1 = 1
2 = 1

No node has indegree 0.

Queue = []

Processed Nodes = 0 < V

Cycle Exists.

Time Complexity: O(V + E)

Space Complexity: O(V)
- indegree array
- queue
*/
