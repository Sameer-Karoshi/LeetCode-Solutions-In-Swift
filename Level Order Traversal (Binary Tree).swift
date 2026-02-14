class Solution {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        // result:
        // Stores final answer.
        // Each inner array contains values of one level.
        // Example: [[3], [9,20], [15,7]]
        var result: [[Int]] = []
        
        // If tree is empty, return empty result
        guard let root = root else {
            return result
        }
        
        // queue:
        // Stores nodes waiting to be processed.
        // Works in FIFO order.
        // Helps traverse tree level by level.
        var queue: [TreeNode] = []
        
        // Start by adding root node
        queue.append(root)
        
        // Traverse until queue becomes empty
        while !queue.isEmpty {
            
            // Number of nodes at current level
            let levelSize = queue.count
            
            // Stores current level values
            var level: [Int] = []
            
            // Process all nodes of current level
            for _ in 0..<levelSize {
                
                // Remove first node from queue
                let node = queue.removeFirst()
                
                // Add node value to level array
                level.append(node.val)
                
                // Add left child to queue if exists
                if let left = node.left {
                    queue.append(left)
                }
                
                // Add right child to queue if exists
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            // Add current level to result
            result.append(level)
        }
        
        // Return final result
        return result
    }
}
