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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var previous: Int?
        var minimum = Int.max

        func inorder(_ node: TreeNode?) {
            guard let node else {
                return
            }

            // Left
            inorder(node.left)

            // Current
            if let previous {
                minimum = min(minimum, node.val - previous)
            }

            previous = node.val

            // Right
            inorder(node.right)
        }

        inorder(root)

        return minimum
    }
}
