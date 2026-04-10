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
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var i = 0   // pointer to traverse preorder
        return build(preorder, &i, Int.max)
    }
    
    // Recursive helper
    private func build(_ preorder: [Int], _ i: inout Int, _ bound: Int) -> TreeNode? {
        
        // Base case:
        // 1. If all elements are used
        // 2. If current value exceeds allowed bound
        if i == preorder.count || preorder[i] > bound {
            return nil
        }
        
        // Create root node
        let root = TreeNode(preorder[i])
        i += 1
        
        // Build LEFT subtree (values < root.val)
        root.left = build(preorder, &i, root.val)
        
        // Build RIGHT subtree (values < bound but > root.val)
        root.right = build(preorder, &i, bound)
        
        return root
    }
}
