class Solution {
    
    func shortestPath(
        _ edges: [[Int]],
        _ N: Int,
        _ M: Int,
        _ src: Int
    ) -> [Int] {
        
        // 1. Create adjacency list
        var adj = Array(repeating: [Int](), count: N)
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            
            // Undirected graph
            adj[u].append(v)
            adj[v].append(u)
        }
        
        // 2. Distance array
        var distance = Array(repeating: Int.max, count: N)
        
        // Source distance = 0
        distance[src] = 0
        
        // 3. Queue
        var queue = [Int]()
        queue.append(src)
        
        // 4. BFS
        while !queue.isEmpty {
            
            let node = queue.removeFirst()
            
            for neighbor in adj[node] {
                
                // Every edge has weight 1
                if distance[node] + 1 < distance[neighbor] {
                    
                    distance[neighbor] = distance[node] + 1
                    
                    queue.append(neighbor)
                }
            }
        }
        
        // 5. Convert unreachable nodes to -1
        for i in 0..<N {
            if distance[i] == Int.max {
                distance[i] = -1
            }
        }
        
        return distance
    }
}
