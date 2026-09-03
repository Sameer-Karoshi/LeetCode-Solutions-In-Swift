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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        var currentSum = 0

        dfs(root, targetSum, &currentSum, &result, &path)
        return result
    }

    func dfs(
        _ node: TreeNode?,
        _ targetSum: Int,
        _ currentSum: inout Int,
        _ result: inout [[Int]],
        _ path: inout [Int]
    ) {
        guard let node else {
            return
        }

        currentSum += node.val
        path.append(node.val)

        if node.left == nil && node.right == nil {
            if currentSum == targetSum {
                result.append(path)
            }
        } else {
            dfs(node.left, targetSum, &currentSum, &result, &path)
            dfs(node.right, targetSum, &currentSum, &result, &path)
        }

        currentSum -= node.val
        path.removeLast()
    }
}
