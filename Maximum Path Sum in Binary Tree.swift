// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var answer = Int.min
        _ = dfs(root, &answer)
        return answer
    }
    
    // Returns maximum single branch path upward
    func dfs(_ node: TreeNode?, _ answer: inout Int) -> Int {
        
        guard let node = node else {
            return 0
        }
        
        // Get left and right branch sums
        let left = max(0, dfs(node.left, &answer))
        let right = max(0, dfs(node.right, &answer))
        
        // Update max path (split case)
        answer = max(answer, node.val + left + right)
        
        // Return single branch upward
        return node.val + max(left, right)
    }
}
