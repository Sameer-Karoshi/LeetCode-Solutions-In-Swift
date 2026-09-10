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
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var result = 0

        func dfs(_ node: TreeNode?) -> (sum: Int, count: Int) {
            guard let node else {
                return (0, 0)
            }

            let left = dfs(node.left)
            let right = dfs(node.right)

            let sum = node.val + left.sum + right.sum
            let count = 1 + left.count + right.count

            if node.val == sum / count {
                result += 1
            }

            return (sum, count)
        }

        dfs(root)

        return result
    }
}
