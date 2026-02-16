class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        // Array to store inorder traversal result
        var result: [Int] = []
        
        // Stack to simulate recursion
        var stack: [TreeNode] = []
        
        // Pointer to current node
        var current = root
        
        // Single while loop handles everything
        while current != nil || !stack.isEmpty {
            
            // If current is not nil, push it and move left
            if let node = current {
                
                stack.append(node)   // Save node to come back later
                current = node.left  // Move to left child
                
            } else {
                
                // Left is finished, process node
                let node = stack.removeLast()  // Pop last node
                
                result.append(node.val)       // Visit root
                
                // Now move to right subtree
                current = node.right
            }
        }
        
        return result
    }
}
