public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    private var first: TreeNode? = nil   // First node to swap
    private var middle: TreeNode? = nil  // Middle node in case of adjacent swap
    private var last: TreeNode? = nil    // Last node to swap (if non-adjacent)
    private var prev: TreeNode? = nil    // Previous node in inorder traversal

    func recoverTree(_ root: TreeNode?) {
        // Step 1: Detect swapped nodes using inorder traversal
        inorder(root)
        
        // Step 2: Fix the swapped nodes
        if let first = first, let last = last {
            // Non-adjacent nodes
            swap(&first.val, &last.val)
        } else if let first = first, let middle = middle {
            // Adjacent nodes
            swap(&first.val, &middle.val)
        }
    }
    
    private func inorder(_ root: TreeNode?) {
        guard let root = root else { return }
        
        // Traverse left subtree
        inorder(root.left)
        
        // Detect violation
        if let prev = prev, prev.val > root.val {
            // First violation
            if first == nil {
                first = prev
                middle = root
            } else {
                // Second violation (non-adjacent swap)
                last = root
            }
        }
        
        // Update previous node
        prev = root
        
        // Traverse right subtree
        inorder(root.right)
    }
}
