/*
 Definition for a binary tree node
 */
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
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        // Start with full integer range
        return validate(root, Int.min, Int.max)
    }
    
    // Helper function with fixed range
    private func validate(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Bool {
        
        // Base case
        guard let node = node else {
            return true
        }
        
        // Check BST condition
        if node.val <= minVal || node.val >= maxVal {
            return false
        }
        
        // Left → max becomes node.val
        // Right → min becomes node.val
        return validate(node.left, minVal, node.val) &&
               validate(node.right, node.val, maxVal)
    }
}
