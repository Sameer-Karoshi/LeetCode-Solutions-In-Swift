public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
        self.val = val
    }
}

class Solution {

    // 🔹 Inorder Successor (next greater)
    func inorderSuccessor(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var curr = root
        var succ: TreeNode? = nil

        while let node = curr {
            if node.val > key {
                // possible successor
                succ = node
                curr = node.left
            } else {
                // move right to find bigger value
                curr = node.right
            }
        }

        return succ
    }

    // 🔹 Inorder Predecessor (next smaller)
    func inorderPredecessor(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var curr = root
        var pre: TreeNode? = nil

        while let node = curr {
            if node.val < key {
                // possible predecessor
                pre = node
                curr = node.right
            } else {
                // move left to find smaller value
                curr = node.left
            }
        }

        return pre
    }
}
