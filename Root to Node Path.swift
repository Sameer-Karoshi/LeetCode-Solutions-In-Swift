// Definition for a Binary Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    // Returns the path from root to the target node
    func rootToNodePath(_ root: TreeNode?, _ target: Int) -> [Int] {
        var path: [Int] = []
        
        // Run DFS to find the path
        _ = findPath(root, target, &path)
        
        return path
    }
    
    // DFS helper that tries to find target in subtree
    // Returns true if target exists in this subtree
    private func findPath(_ node: TreeNode?, _ target: Int, _ path: inout [Int]) -> Bool {
        
        // Base case: if the current node is nil,
        // we have reached beyond a leaf node
        // so target cannot exist in this path
        guard let node = node else {
            return false
        }
        
        // Step 1: include current node in the path
        path.append(node.val)
        
        // Step 2: check if this is the target node
        if node.val == target {
            return true
        }
        
        // Step 3: search in the left subtree
        if findPath(node.left, target, &path) {
            return true
        }
        
        // Step 4: search in the right subtree
        if findPath(node.right, target, &path) {
            return true
        }
        
        // Step 5: backtracking
        // target not found in either subtree,
        // so remove current node from path
        path.removeLast()
        
        return false
    }
}
