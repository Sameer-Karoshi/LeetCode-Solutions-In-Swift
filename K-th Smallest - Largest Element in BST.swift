class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    // MARK: - Count total nodes (simple recursion)
    private func countNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + countNodes(root?.left) + countNodes(root?.right)
    }
    
    // MARK: - K-th Smallest using Inorder
    private func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = -1
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else { return }
            
            inorder(node.left)
            
            count += 1
            if count == k {
                result = node.val
                return
            }
            
            inorder(node.right)
        }
        
        inorder(root)
        return result
    }
    
    // MARK: - K-th Largest using (N-K+1)
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        let n = countNodes(root)
        let target = n - k + 1
        return kthSmallest(root, target)
    }
}
