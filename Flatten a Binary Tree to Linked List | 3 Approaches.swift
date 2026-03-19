class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    // =========================================================
    // 🔹 1. RECURSION (Reverse Preorder: Right → Left → Root)
    // =========================================================
    
    var prev: TreeNode? = nil
    
    func flattenRecursive(_ root: TreeNode?) {
        prev = nil
        helper(root)
    }
    
    private func helper(_ node: TreeNode?) {
        if node == nil { return }
        
        // Go Right first
        helper(node?.right)
        
        // Then Left
        helper(node?.left)
        
        // Rewire pointers
        node?.right = prev
        node?.left = nil
        
        // Move prev forward
        prev = node
    }
    
    // Time Complexity: O(N)
    // Space Complexity: O(H) (recursion stack)
    
    
    // =========================================================
    // 🔹 2. ITERATIVE USING STACK (Preorder Simulation)
    // =========================================================
    
    func flattenStack(_ root: TreeNode?) {
        guard let root = root else { return }
        
        var stack: [TreeNode] = [root]
        
        while !stack.isEmpty {
            let curr = stack.removeLast()
            
            // Push right first (so left is processed first)
            if let right = curr.right {
                stack.append(right)
            }
            
            if let left = curr.left {
                stack.append(left)
            }
            
            // Connect to next node in stack
            if let next = stack.last {
                curr.right = next
            }
            
            curr.left = nil
        }
    }
    
    // Time Complexity: O(N)
    // Space Complexity: O(N)
    
    
    // =========================================================
    // 🔹 3. MORRIS TRAVERSAL (Optimal - O(1) Space)
    // =========================================================
    
    func flattenMorris(_ root: TreeNode?) {
        var curr = root
        
        while curr != nil {
            
            if curr?.left != nil {
                
                // Find rightmost node of left subtree
                var prev = curr?.left
                while prev?.right != nil {
                    prev = prev?.right
                }
                
                // Attach original right subtree
                prev?.right = curr?.right
                
                // Move left subtree to right
                curr?.right = curr?.left
                curr?.left = nil
            }
            
            // Move to next node
            curr = curr?.right
        }
    }
    
    // Time Complexity: O(N)
    // Space Complexity: O(1) ✅ BEST
}
