// Definition for a Binary Tree Node
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
    
    // Function to return Zig-Zag Traversal of Binary Tree
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        
        // Edge case: if tree is empty
        if root == nil {
            return []
        }
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        
        // Insert root into queue
        queue.append(root!)
        
        // Direction flag
        var leftToRight = true
        
        // Standard BFS traversal
        while !queue.isEmpty {
            
            let levelSize = queue.count
            var currentLevel = [Int](repeating: 0, count: levelSize)
            
            for i in 0..<levelSize {
                
                // Remove first element (FIFO)
                let node = queue.removeFirst()
                
                // Determine index based on direction
                let index = leftToRight ? i : (levelSize - 1 - i)
                currentLevel[index] = node.val
                
                // Push left child
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                
                // Push right child
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            
            // Add current level to result
            result.append(currentLevel)
            
            // Toggle direction
            leftToRight.toggle()
        }
        
        return result
    }
}
