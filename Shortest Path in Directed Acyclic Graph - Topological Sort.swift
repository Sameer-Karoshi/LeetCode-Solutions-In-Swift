class Solution {
    
    func shortestPath(_ edges: [[Int]], _ N: Int, _ M: Int) -> [Int] {
        
        // 1. Create adjacency list
        var adj = Array(repeating: [(node: Int, weight: Int)](), count: N)
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let weight = edge[2]
            
            adj[u].append((v, weight))
        }
        
        // 2. Topological Sort using DFS
        var visited = Array(repeating: false, count: N)
        var stack = [Int]()
        
        func dfs(_ node: Int) {
            visited[node] = true
            
            for edge in adj[node] {
                if !visited[edge.node] {
                    dfs(edge.node)
                }
            }
            
            // Add after visiting all neighbours
            stack.append(node)
        }
        
        // Run DFS for every node
        for i in 0..<N {
            if !visited[i] {
                dfs(i)
            }
        }
        
        // 3. Distance array
        var distance = Array(repeating: Int.max, count: N)
        distance[0] = 0
        
        // 4. Process topological order
        while !stack.isEmpty {
            
            let node = stack.removeLast()
            
            // If node is unreachable, skip it
            if distance[node] == Int.max {
                continue
            }
            
            // Relax all outgoing edges
            for edge in adj[node] {
                
                if distance[node] + edge.weight < distance[edge.node] {
                    distance[edge.node] = distance[node] + edge.weight
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
