class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        var minDepth = Int.max
        findMinDepth(root, 1, &minDepth)

        return minDepth
    }

    func findMinDepth(
        _ node: TreeNode?,
        _ currentDepth: Int,
        _ minDepth: inout Int
    ) {
        guard let node else {
            return
        }

        if node.left == nil && node.right == nil {
            minDepth = min(minDepth, currentDepth)
            return
        }

        findMinDepth(node.left, currentDepth + 1, &minDepth)
        findMinDepth(node.right, currentDepth + 1, &minDepth)
    }
}
