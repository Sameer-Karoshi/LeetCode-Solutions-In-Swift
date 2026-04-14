// Definition for a binary tree node
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

// BST Iterator Class (Safe - No force unwrap)
class BSTIterator {
    private var stack: [TreeNode] = []
    private var reverse: Bool
    
    init(_ root: TreeNode?, _ isReverse: Bool) {
        self.reverse = isReverse
        pushAll(root)
    }
    
    // Push nodes safely without using !
    private func pushAll(_ node: TreeNode?) {
        var curr = node
        
        while let currentNode = curr {
            stack.append(currentNode)
            
            // Direction depends on traversal type
            if reverse {
                curr = currentNode.right
            } else {
                curr = currentNode.left
            }
        }
    }
    
    // Get next element safely
    func next() -> Int? {
        // Safely pop node
        guard let node = stack.popLast() else {
            return nil
        }
        
        // Push next subtree
        if reverse {
            pushAll(node.left)
        } else {
            pushAll(node.right)
        }
        
        return node.val
    }
}

// Main Solution Class
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        
        let leftIterator = BSTIterator(root, false)
        let rightIterator = BSTIterator(root, true)
        
        // Safely get initial values
        guard var i = leftIterator.next(),
              var j = rightIterator.next() else {
            return false
        }
        
        // Two pointer logic
        while i < j {
            let sum = i + j
            
            if sum == k {
                return true
            } else if sum < k {
                // Move left iterator
                guard let nextVal = leftIterator.next() else {
                    return false
                }
                i = nextVal
            } else {
                // Move right iterator
                guard let nextVal = rightIterator.next() else {
                    return false
                }
                j = nextVal
            }
        }
        
        return false
    }
}
