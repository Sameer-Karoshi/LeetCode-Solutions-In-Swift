// Definition of Binary Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        
        // If root or target is nil return empty array
        guard let root = root, let target = target else {
            return []
        }
        
        // Dictionary to store parent of each node
        // Key = child node identifier
        // Value = parent node
        var parentMap: [ObjectIdentifier: TreeNode] = [:]
        
        // Step 1: Fill parent map
        markParents(root, &parentMap)
        
        // Queue for BFS traversal
        var queue: [TreeNode] = [target]
        
        // Set to track visited nodes (to avoid revisiting)
        var visited: Set<ObjectIdentifier> = [ObjectIdentifier(target)]
        
        // Current distance from target
        var distance = 0
        
        // BFS traversal
        while !queue.isEmpty {
            
            // If we reached distance K stop expanding
            if distance == k {
                break
            }
            
            let size = queue.count
            distance += 1
            
            // Traverse nodes at current level
            for _ in 0..<size {
                
                let node = queue.removeFirst()
                
                // Visit left child
                if let left = node.left,
                   !visited.contains(ObjectIdentifier(left)) {
                    
                    visited.insert(ObjectIdentifier(left))
                    queue.append(left)
                }
                
                // Visit right child
                if let right = node.right,
                   !visited.contains(ObjectIdentifier(right)) {
                    
                    visited.insert(ObjectIdentifier(right))
                    queue.append(right)
                }
                
                // Visit parent node
                if let parent = parentMap[ObjectIdentifier(node)],
                   !visited.contains(ObjectIdentifier(parent)) {
                    
                    visited.insert(ObjectIdentifier(parent))
                    queue.append(parent)
                }
            }
        }
        
        // All nodes remaining in queue are at distance K
        var result: [Int] = []
        
        for node in queue {
            result.append(node.val)
        }
        
        return result
    }
    
    
    // Function to map each node to its parent
    func markParents(_ root: TreeNode?, _ parentMap: inout [ObjectIdentifier: TreeNode]) {
        
        guard let root = root else { return }
        
        // BFS traversal
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            
            let node = queue.removeFirst()
            
            // Store parent for left child
            if let left = node.left {
                parentMap[ObjectIdentifier(left)] = node
                queue.append(left)
            }
            
            // Store parent for right child
            if let right = node.right {
                parentMap[ObjectIdentifier(right)] = node
                queue.append(right)
            }
        }
    }
}
