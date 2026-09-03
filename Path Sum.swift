class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        var currentSum = 0
        return calSum(root, targetSum, &currentSum)
    }

    func calSum(_ node: TreeNode?, _ targetSum: Int, _ currentSum: inout Int) -> Bool {
        guard let node else {
            return false
        }

        currentSum += node.val // add node

        if node.left == nil && node.right == nil {
            let result = currentSum == targetSum // check leaf
            currentSum -= node.val // backtrack
            return result
        }

        let result = calSum(node.left, targetSum, &currentSum) ||
                     calSum(node.right, targetSum, &currentSum)

        currentSum -= node.val // backtrack
        return result
    }
}
