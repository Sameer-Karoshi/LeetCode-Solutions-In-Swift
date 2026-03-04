// Definition for a binary tree node.
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        // Empty tree is symmetric
        guard let root = root else { return true }
        
        return isMirror(root.left, root.right)
    }
    
    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        
        // If both nil → symmetric
        if left == nil && right == nil {
            return true
        }
        
        // If one nil → not symmetric
        guard let leftNode = left,
              let rightNode = right else {
            return false
        }
        
        // Values must match
        guard leftNode.val == rightNode.val else {
            return false
        }
        
        // Check mirror condition
        return isMirror(leftNode.left, rightNode.right) &&
               isMirror(leftNode.right, rightNode.left)
    }
}
