/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let root else {
            return false
        }

        // Leaf node
        if root.val == 0 {
            return false
        }

        if root.val == 1 {
            return true
        }

        // OR
        if root.val == 2 {
            return evaluateTree(root.left) || evaluateTree(root.right)
        }

        // AND
        return evaluateTree(root.left) && evaluateTree(root.right)
    }
}
