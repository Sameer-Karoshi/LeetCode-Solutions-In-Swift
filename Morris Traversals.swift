class Solution {
    
    // MARK: - Morris Inorder Traversal (Left → Node → Right)
    func morrisInorder(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var current = root
        
        while let curr = current {
            
            // Case 1: No left child → visit and go right
            if curr.left == nil {
                result.append(curr.val)
                current = curr.right
            } else {
                // Find inorder predecessor (rightmost node in left subtree)
                var prev = curr.left
                
                while let next = prev?.right, next !== curr {
                    prev = next
                }
                
                if prev?.right == nil {
                    // Create thread to come back later
                    prev?.right = curr
                    current = curr.left
                } else {
                    // Thread already exists → remove it
                    prev?.right = nil
                    
                    // Visit node AFTER left subtree is done
                    result.append(curr.val)
                    
                    // Move to right subtree
                    current = curr.right
                }
            }
        }
        
        return result
    }
    
    
    // MARK: - Morris Preorder Traversal (Node → Left → Right)
    func morrisPreorder(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var current = root
        
        while let curr = current {
            
            // Case 1: No left child → visit and go right
            if curr.left == nil {
                result.append(curr.val)
                current = curr.right
            } else {
                // Find predecessor (rightmost node in left subtree)
                var prev = curr.left
                
                while let next = prev?.right, next !== curr {
                    prev = next
                }
                
                if prev?.right == nil {
                    // PREORDER difference:
                    // Visit BEFORE going to left subtree
                    result.append(curr.val)
                    
                    // Create thread
                    prev?.right = curr
                    current = curr.left
                } else {
                    // Thread exists → remove it
                    prev?.right = nil
                    
                    // Move to right subtree
                    current = curr.right
                }
            }
        }
        
        return result
    }
}
