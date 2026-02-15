/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() {
 *         self.val = 0
 *         self.left = nil
 *         self.right = nil
 *     }
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        // Result array to store preorder values
        var result: [Int] = []
        
        // Edge case: if tree is empty
        guard let root = root else { return result }
        
        // Stack to simulate recursion
        var stack: [TreeNode] = []
        
        // Push root first
        stack.append(root)
        
        while !stack.isEmpty {
            
            // Pop last element (LIFO)
            let current = stack.removeLast()
            
            // 1️⃣ Visit Root
            result.append(current.val)
            
            // 2️⃣ Push Right first (because stack is LIFO)
            if let right = current.right {
                stack.append(right)
            }
            
            // 3️⃣ Push Left
            if let left = current.left {
                stack.append(left)
            }
        }
        
        return result
    }
}
