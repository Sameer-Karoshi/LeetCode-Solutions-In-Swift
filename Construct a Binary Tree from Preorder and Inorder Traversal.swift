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
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        // Map inorder values to indices
        var inMap: [Int: Int] = [:]
        for (i, val) in inorder.enumerated() {
            inMap[val] = i
        }
        
        return build(preorder, 0, preorder.count - 1,
                     inorder, 0, inorder.count - 1,
                     inMap)
    }
    
    func build(
        _ preorder: [Int],
        _ preStart: Int,
        _ preEnd: Int,
        _ inorder: [Int],
        _ inStart: Int,
        _ inEnd: Int,
        _ inMap: [Int: Int]
    ) -> TreeNode? {
        
        // Base case: no elements left
        if preStart > preEnd || inStart > inEnd {
            return nil
        }
        
        // Root node value
        let rootVal = preorder[preStart]
        let root = TreeNode(rootVal)
        
        // Safely get root index in inorder
        guard let inRoot = inMap[rootVal] else {
            return nil
        }
        
        // Count nodes in left subtree
        let numsLeft = inRoot - inStart
        
        // Build left subtree
        root.left = build(
            preorder,
            preStart + 1,
            preStart + numsLeft,
            inorder,
            inStart,
            inRoot - 1,
            inMap
        )
        
        // Build right subtree
        root.right = build(
            preorder,
            preStart + numsLeft + 1,
            preEnd,
            inorder,
            inRoot + 1,
            inEnd,
            inMap
        )
        
        return root
    }
}
