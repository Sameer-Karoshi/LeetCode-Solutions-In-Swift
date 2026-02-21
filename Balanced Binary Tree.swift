// Definition for Binary Tree Node
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
    
    // Main function
    func isBalanced(_ root: TreeNode?) -> Bool {
        // If maxHeight returns -1 → tree is not balanced
        return maxHeight(root) != -1
    }
    
    // Striver style maxHeight function
    // Returns:
    //   height if subtree is balanced
    //   -1 if subtree is NOT balanced
    private func maxHeight(_ node: TreeNode?) -> Int {
        
        // Base case: empty node → height = 0
        if node == nil {
            return 0
        }
        
        // Recursively get left subtree height
        let leftHeight = maxHeight(node?.left)
        
        // If left subtree already unbalanced → stop immediately
        if leftHeight == -1 {
            return -1
        }
        
        // Recursively get right subtree height
        let rightHeight = maxHeight(node?.right)
        
        // If right subtree already unbalanced → stop immediately
        if rightHeight == -1 {
            return -1
        }
        
        // Check balance condition
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        
        // Return height of current node
        return 1 + max(leftHeight, rightHeight)
    }
}
