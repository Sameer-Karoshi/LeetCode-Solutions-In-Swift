/**
 Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        
        // Local variable to store maximum diameter
        var diameter = 0
        
        // Pass diameter as inout (reference)
        _ = height(root, &diameter)
        
        return diameter
    }
    
    // Height function which updates diameter using inout
    private func height(_ node: TreeNode?, _ diameter: inout Int) -> Int {
        
        // Base case: if node is nil
        guard let node = node else {
            return 0
        }
        
        // Get left subtree height
        let leftHeight = height(node.left, &diameter)
        
        // Get right subtree height
        let rightHeight = height(node.right, &diameter)
        
        // Update diameter
        diameter = max(diameter, leftHeight + rightHeight)
        
        // Return height of current node
        return 1 + max(leftHeight, rightHeight)
    }
}
