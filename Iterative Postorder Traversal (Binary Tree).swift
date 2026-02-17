/**
 Definition for a binary tree node.
 */
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

    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        // Result array
        var result: [Int] = []

        // Edge case
        guard let root = root else {
            return result
        }

        // Stack1 → used for traversal
        var stack1: [TreeNode] = []

        // Stack2 → stores nodes in reverse postorder
        var stack2: [TreeNode] = []

        // Push root into stack1
        stack1.append(root)

        // Process until stack1 is empty
        while !stack1.isEmpty {

            // Pop from stack1
            let current = stack1.removeLast()

            // Push into stack2
            stack2.append(current)

            // Push left child into stack1
            if let left = current.left {
                stack1.append(left)
            }

            // Push right child into stack1
            if let right = current.right {
                stack1.append(right)
            }
        }

        // Stack2 contains reverse postorder
        // Pop from stack2 to get postorder
        while !stack2.isEmpty {
            result.append(stack2.removeLast().val)
        }

        return result
    }
}
