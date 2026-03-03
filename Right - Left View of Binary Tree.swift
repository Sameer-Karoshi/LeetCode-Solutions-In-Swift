// Definition for Binary Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var result: [Int] = []
        
        // Start DFS with level 0
        dfs(root, 0, &result)
        
        return result
    }
    
    private func dfs(_ node: TreeNode?, _ level: Int, _ result: inout [Int]) {
        
        // Base case
        guard let node = node else { return }
        
        // If this is first time we are visiting this level
        if level == result.count {
            result.append(node.val)
        }
        
        // Go RIGHT first (very important)
        dfs(node.right, level + 1, &result)
        
        // Then go LEFT
        dfs(node.left, level + 1, &result)
    }
}
