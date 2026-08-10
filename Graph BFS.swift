class Solution {

    // TC: O(V + E)
    // (Undirected Graph: O(V + 2E) -> O(V + E))
    // SC: O(V)  // Queue + Visited

    func bfsOfGraph(_ V: Int, _ adj: [[Int]]) -> [Int] {

        var result: [Int] = []
        var queue: [Int] = [0]
        var visited = Array(repeating: false, count: V)

        visited[0] = true

        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node)

            for neighbor in adj[node] {
                if !visited[neighbor] {
                    visited[neighbor] = true
                    queue.append(neighbor)
                }
            }
        }

        return result
    }
}
