/**
 * Definition for a binary tree node.
 * TreeNode is a class (reference type)
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
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        // This array will store final postorder result
        var result: [Int] = []
        
        // Stack is used to simulate recursion
        var stack: [TreeNode] = []
        
        // Current pointer to traverse the tree
        var current = root
        
        // Run until all nodes are processed
        while current != nil || !stack.isEmpty {
            
            // Step 1: Go as left as possible
            if let node = current {
                
                // Push current node into stack
                stack.append(node)
                
                // Move to left child
                current = node.left
                
            } else {
                
                // Step 2: Check right child of top node
                let rightChild = stack.last!.right
                
                // If right child is nil, process the node
                if rightChild == nil {
                    
                    // Pop the node from stack
                    let node = stack.removeLast()
                    
                    // Add node value to result
                    result.append(node.val)
                    
                    // Step 3:
                    // Check if this node was right child of stack top
                    // If yes, process parent also
                    while !stack.isEmpty && node === stack.last!.right {
                        
                        // Pop parent node
                        let parent = stack.removeLast()
                        
                        // Add parent value to result
                        result.append(parent.val)
                    }
                    
                } else {
                    
                    // Step 4:
                    // If right child exists, move to right subtree
                    current = rightChild
                }
            }
        }
        
        // Return final postorder traversal
        return result
    }
}
