class Solution {
    
    func findOrder(_ dict: [String], _ N: Int, _ K: Int) -> String {
        
        var adj = Array(repeating: [Int](), count: K)
        var indegree = Array(repeating: 0, count: K)
        
        // Build graph
        for i in 0..<(N - 1) {
            
            let word1 = Array(dict[i])
            let word2 = Array(dict[i + 1])
            
            let len = min(word1.count, word2.count)
            
            for j in 0..<len {
                
                if word1[j] != word2[j] {
                    
                    let u = Int(word1[j].asciiValue! - Character("a").asciiValue!)
                    let v = Int(word2[j].asciiValue! - Character("a").asciiValue!)
                    
                    adj[u].append(v)
                    indegree[v] += 1
                    
                    break
                }
            }
        }
        
        // Add nodes with indegree 0
        var queue = [Int]()
        
        for i in 0..<K {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        
        // Topological Sort
        var ans = ""
        
        while !queue.isEmpty {
            
            let node = queue.removeFirst()
            
            ans.append(Character(UnicodeScalar(node + 97)!))
            
            for neighbor in adj[node] {
                
                indegree[neighbor] -= 1
                
                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        // Cycle check
        if ans.count != K {
            return ""
        }
        
        return ans
    }
}
