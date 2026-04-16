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

// Helper class to store info about subtree
class NodeValue {
    var minVal: Int
    var maxVal: Int
    var maxSize: Int
    
    init(_ minVal: Int, _ maxVal: Int, _ maxSize: Int) {
        self.minVal = minVal
        self.maxVal = maxVal
        self.maxSize = maxSize
    }
}

class Solution {
    
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        return helper(root).maxSize
    }
    
    private func helper(_ root: TreeNode?) -> NodeValue {
        
        // 🔹 Base case:
        // An empty tree is a BST of size 0
        // min = +∞, max = -∞ helps in comparison
        guard let root = root else {
            return NodeValue(Int.max, Int.min, 0)
        }
        
        // 🔹 Recursively get left and right subtree info
        let left = helper(root.left)
        let right = helper(root.right)
        
        // 🔹 Check if current tree is a BST
        if left.maxVal < root.val && root.val < right.minVal {
            
            // ✅ Valid BST
            
            // Update min and max for this subtree
            let minVal = min(root.val, left.minVal)
            let maxVal = max(root.val, right.maxVal)
            
            // Total size = left + right + root
            let size = left.maxSize + right.maxSize + 1
            
            return NodeValue(minVal, maxVal, size)
        }
        
        // ❌ Not a BST
        
        // Return invalid range so parent also fails BST condition
        // BUT carry the largest size found so far
        return NodeValue(Int.min, Int.max, max(left.maxSize, right.maxSize))
    }
}
