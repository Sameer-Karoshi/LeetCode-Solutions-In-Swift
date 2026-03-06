// Definition for a Binary Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    // Function to find Lowest Common Ancestor
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // Base case: if node is nil we cannot find anything
        guard let root = root else {
            return nil
        }
        
        // If current node matches p or q
        // this node could be the LCA
        if root === p || root === q {
            return root
        }
        
        // Search in left subtree
        let left = lowestCommonAncestor(root.left, p, q)
        
        // Search in right subtree
        let right = lowestCommonAncestor(root.right, p, q)
        
        // Case 1: both sides returned a node
        // meaning p and q are found in different subtrees
        if left != nil && right != nil {
            return root
        }
        
        // Case 2: only one side returned a node
        // propagate that node upward
        return left ?? right
    }
}
