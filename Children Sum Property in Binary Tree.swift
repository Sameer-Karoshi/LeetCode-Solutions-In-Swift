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
    
    // Function to enforce Children Sum Property
    func changeTree(_ root: TreeNode?) {
        guard let root = root else { return }
        
        var childSum = 0
        
        // Step 1: Calculate sum of children
        if let left = root.left {
            childSum += left.val
        }
        if let right = root.right {
            childSum += right.val
        }
        
        // Step 2: If children sum is greater, update parent
        if childSum >= root.val {
            root.val = childSum
        } else {
            // If parent is greater, push value down to children
            if let left = root.left {
                left.val = root.val
            }
            if let right = root.right {
                right.val = root.val
            }
        }
        
        // Step 3: Recur for left and right subtree
        changeTree(root.left)
        changeTree(root.right)
        
        // Step 4: After recursion, fix the parent value again
        var total = 0
        
        if let left = root.left {
            total += left.val
        }
        if let right = root.right {
            total += right.val
        }
        
        // If not a leaf node, update root value
        if root.left != nil || root.right != nil {
            root.val = total
        }
    }
}
