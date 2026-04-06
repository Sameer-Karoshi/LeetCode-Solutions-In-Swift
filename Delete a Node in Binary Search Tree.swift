/*
 Definition for a Binary Tree Node
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
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        // Base case
        guard let root = root else {
            return nil
        }
        
        // If key < root → go left
        if key < root.val {
            root.left = deleteNode(root.left, key)
        }
        // If key > root → go right
        else if key > root.val {
            root.right = deleteNode(root.right, key)
        }
        // Node found
        else {
            return helper(root)
        }
        
        return root
    }
    
    // Striver helper function
    func helper(_ node: TreeNode) -> TreeNode? {
        
        // Case 1: no left child
        if node.left == nil {
            return node.right
        }
        
        // Case 2: no right child
        if node.right == nil {
            return node.left
        }
        
        // Case 3: both children exist
        
        // Store right subtree
        let rightChild = node.right
        
        // Find last right of left subtree
        let lastRight = findLastRight(node.left)
        
        // Attach right subtree to the rightmost node of left subtree
        lastRight?.right = rightChild
        
        // Return left subtree as new root
        return node.left
    }
    
    // Find rightmost node (max) in left subtree
    func findLastRight(_ node: TreeNode?) -> TreeNode? {
        var current = node
        
        while current?.right != nil {
            current = current?.right
        }
        
        return current
    }
}
