class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let root = root else { return 0 }

        return countPaths(root, targetSum)
             + pathSum(root.left, targetSum)
             + pathSum(root.right, targetSum)
    }

    func countPaths(_ node: TreeNode?, _ target: Int) -> Int {
        guard let node = node else { return 0 }

        var count = 0

        // Found a valid path
        if node.val == target {
            count += 1
        }

        // Continue path through left child
        count += countPaths(
            node.left,
            target - node.val
        )

        // Continue path through right child
        count += countPaths(
            node.right,
            target - node.val
        )

        return count
    }
}
