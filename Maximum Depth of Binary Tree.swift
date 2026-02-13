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
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(root)
    }

    private func dfs(_ node: TreeNode?) -> Int {
        // Base case
        guard let node = node else {
            return 0
        }

        let leftDepth = dfs(node.left)
        let rightDepth = dfs(node.right)

        return 1 + max(leftDepth, rightDepth)
    }
}
