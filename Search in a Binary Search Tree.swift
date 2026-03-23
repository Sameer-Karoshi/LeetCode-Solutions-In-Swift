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
    
    // Iterative search using while loop (no recursion)
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        // Start from root
        var current = root
        
        // Loop until node becomes nil OR value is found
        while let node = current, node.val != val {
            
            // Move left if target is smaller
            if val < node.val {
                current = node.left
            }
            // Move right if target is greater
            else {
                current = node.right
            }
        }
        
        // Returns:
        // - Found node if exists
        // - nil if not found
        return current
    }
}
