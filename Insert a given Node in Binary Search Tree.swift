// Definition for a binary tree node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    /// Inserts a value into a BST using iterative approach (Striver style)
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        // If tree is empty, return new node
        if root == nil {
            return TreeNode(val)
        }
        
        var current = root
        
        // Infinite loop until we insert the node
        while true {
            
            // Safely unwrap current node
            guard let node = current else {
                break
            }
            
            // Go to left subtree
            if val < node.val {
                
                // If left is nil → insert here
                if node.left == nil {
                    node.left = TreeNode(val)
                    break
                } else {
                    current = node.left
                }
                
            } else {
                // Go to right subtree
                
                // If right is nil → insert here
                if node.right == nil {
                    node.right = TreeNode(val)
                    break
                } else {
                    current = node.right
                }
            }
        }
        
        return root
    }
}
