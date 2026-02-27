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
    
    // Main Function
    func boundaryTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = []
        
        // Root is always part of boundary
        if !isLeaf(root) {
            result.append(root.val)
        }
        
        // 1. Add Left Boundary
        addLeftBoundary(root.left, &result)
        
        // 2. Add Leaf Nodes
        addLeaves(root, &result)
        
        // 3. Add Right Boundary (reverse)
        addRightBoundary(root.right, &result)
        
        return result
    }
    
    // Check if node is leaf
    func isLeaf(_ node: TreeNode?) -> Bool {
        return node?.left == nil && node?.right == nil
    }
    
    // Add Left Boundary (excluding leaf nodes)
    func addLeftBoundary(_ node: TreeNode?, _ result: inout [Int]) {
        var curr = node
        
        while curr != nil {
            if !isLeaf(curr) {
                result.append(curr!.val)
            }
            
            // Prefer left child
            if curr?.left != nil {
                curr = curr?.left
            } else {
                curr = curr?.right
            }
        }
    }
    
    // Add all leaf nodes using DFS
    func addLeaves(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else { return }
        
        if isLeaf(node) {
            result.append(node.val)
            return
        }
        
        addLeaves(node.left, &result)
        addLeaves(node.right, &result)
    }
    
    // Add Right Boundary in reverse order
    func addRightBoundary(_ node: TreeNode?, _ result: inout [Int]) {
        var curr = node
        var temp: [Int] = []
        
        while curr != nil {
            if !isLeaf(curr) {
                temp.append(curr!.val)
            }
            
            // Prefer right child
            if curr?.right != nil {
                curr = curr?.right
            } else {
                curr = curr?.left
            }
        }
        
        // Reverse before adding
        for val in temp.reversed() {
            result.append(val)
        }
    }
}
