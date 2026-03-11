class Solution {
    
    func minTimeToBurn(_ root: TreeNode?, _ target: TreeNode?) -> Int {
        
        guard let root = root, let target = target else {
            return 0
        }
        
        // Parent map
        var parentMap: [ObjectIdentifier: TreeNode] = [:]
        markParents(root, &parentMap)
        
        // BFS Queue
        var queue: [TreeNode] = [target]
        
        // Visited set
        var visited: Set<ObjectIdentifier> = [ObjectIdentifier(target)]
        
        var time = 0
        
        while !queue.isEmpty {
            
            let size = queue.count
            var burnedNewNode = false
            
            for _ in 0..<size {
                
                let node = queue.removeFirst()
                
                // Left child
                if let left = node.left,
                   !visited.contains(ObjectIdentifier(left)) {
                    
                    visited.insert(ObjectIdentifier(left))
                    queue.append(left)
                    burnedNewNode = true
                }
                
                // Right child
                if let right = node.right,
                   !visited.contains(ObjectIdentifier(right)) {
                    
                    visited.insert(ObjectIdentifier(right))
                    queue.append(right)
                    burnedNewNode = true
                }
                
                // Parent
                if let parent = parentMap[ObjectIdentifier(node)],
                   !visited.contains(ObjectIdentifier(parent)) {
                    
                    visited.insert(ObjectIdentifier(parent))
                    queue.append(parent)
                    burnedNewNode = true
                }
            }
            
            // If fire spread to new nodes increase time
            if burnedNewNode {
                time += 1
            }
        }
        
        return time
    }
    
    
    // Same function from your code
    func markParents(_ root: TreeNode?, _ parentMap: inout [ObjectIdentifier: TreeNode]) {
        
        guard let root = root else { return }
        
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            
            let node = queue.removeFirst()
            
            if let left = node.left {
                parentMap[ObjectIdentifier(left)] = node
                queue.append(left)
            }
            
            if let right = node.right {
                parentMap[ObjectIdentifier(right)] = node
                queue.append(right)
            }
        }
    }
}
