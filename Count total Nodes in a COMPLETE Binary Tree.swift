// Definition for a binary tree node
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
    
    // Function to count nodes in Complete Binary Tree
    func countNodes(_ root: TreeNode?) -> Int {
        
        // Base case
        if root == nil {
            return 0
        }
        
        // Find left height
        let lh = leftHeight(root)
        
        // Find right height
        let rh = rightHeight(root)
        
        // If heights are equal → Perfect Binary Tree
        if lh == rh {
            return (1 << lh) - 1   // 2^h - 1 nodes
        }
        
        // Otherwise recursively count
        return 1 + countNodes(root?.left) + countNodes(root?.right)
    }
    
    // Calculate height by going left
    func leftHeight(_ node: TreeNode?) -> Int {
        var height = 0
        var current = node
        
        while current != nil {
            height += 1
            current = current?.left
        }
        
        return height
    }
    
    // Calculate height by going right
    func rightHeight(_ node: TreeNode?) -> Int {
        var height = 0
        var current = node
        
        while current != nil {
            height += 1
            current = current?.right
        }
        
        return height
    }
}
