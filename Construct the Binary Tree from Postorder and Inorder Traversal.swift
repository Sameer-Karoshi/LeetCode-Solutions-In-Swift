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
    
    func buildTree(_ postorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        var inMap: [Int: Int] = [:]
        for (i, val) in inorder.enumerated() {
            inMap[val] = i
        }
        
        return build(postorder, 0, postorder.count - 1,
                     inorder, 0, inorder.count - 1,
                     inMap)
    }
    
    func build(
        _ postorder: [Int],
        _ postStart: Int,
        _ postEnd: Int,
        _ inorder: [Int],
        _ inStart: Int,
        _ inEnd: Int,
        _ inMap: [Int: Int]
    ) -> TreeNode? {
        
        // Base case
        if postStart > postEnd || inStart > inEnd {
            return nil
        }
        
        // Root is last element in postorder
        let rootVal = postorder[postEnd]
        let root = TreeNode(rootVal)
        
        guard let inRoot = inMap[rootVal] else {
            return nil
        }
        
        // Number of nodes in left subtree
        let numsLeft = inRoot - inStart
        
        // Build left subtree
        root.left = build(
            postorder,
            postStart,
            postStart + numsLeft - 1,
            inorder,
            inStart,
            inRoot - 1,
            inMap
        )
        
        // Build right subtree
        root.right = build(
            postorder,
            postStart + numsLeft,
            postEnd - 1,
            inorder,
            inRoot + 1,
            inEnd,
            inMap
        )
        
        return root
    }
}
