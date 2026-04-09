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
    
    // Recursive function to find LCA
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        // Base case
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        // If both nodes are smaller → go left
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        
        // If both nodes are greater → go right
        if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        
        // Otherwise → this is the split point (LCA)
        return root
    }
}
