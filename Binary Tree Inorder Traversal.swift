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
    // Main function that returns inorder traversal of the tree
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        dfs(root, &result)
        return result
    }
    
    // Helper DFS function for inorder traversal (Left → Root → Right)
    private func dfs(_ node: TreeNode?, _ result: inout [Int]) {
        // Base case: if node is nil, stop recursion
        guard let node = node else {
            return
        }
        
        // Visit left subtree
        dfs(node.left, &result)
        
        // Visit current node
        result.append(node.val)
        
        // Visit right subtree
        dfs(node.right, &result)
    }
}
