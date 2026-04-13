// Definition for a binary tree node.
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

// BST Iterator class
class BSTIterator {
    
    // Stack to simulate recursion (stores path)
    private var stack: [TreeNode] = []
    
    // Constructor
    init(_ root: TreeNode?) {
        // Push all left nodes starting from root
        pushAllLeft(root)
    }
    
    // Returns the next smallest element
    func next() -> Int {
        // Top node is the next smallest
        let node = stack.removeLast()
        
        // If the node has a right subtree,
        // push all left nodes of that subtree
        if let rightNode = node.right {
            pushAllLeft(rightNode)
        }
        
        return node.val
    }
    
    // Returns true if there exists a next element
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    // Helper function to push all left nodes into stack
    private func pushAllLeft(_ node: TreeNode?) {
        var current = node
        
        while current != nil {
            stack.append(current!)
            current = current!.left
        }
    }
}
