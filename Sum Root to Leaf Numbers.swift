class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var path = ""
        var result = 0
        dfs(node: root, path: &path, result: &result)
        return result
    }

    func dfs(node: TreeNode?, path: inout String, result: inout Int) {
        guard let node else {
            return
        }

        path.append(String(node.val))

        // we reached leaf node
        if node.left == nil && node.right == nil {
            result += Int(path) ?? 0
            path.removeLast()
            return
        }

        dfs(node: node.left, path: &path, result: &result)
        dfs(node: node.right, path: &path, result: &result)

        // Backtrack current node
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
