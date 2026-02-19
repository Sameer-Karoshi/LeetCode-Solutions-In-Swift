import UIKit

// Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

// Pair class to store node and state
class Pair {
    var node: TreeNode
    var state: Int
    
    init(_ node: TreeNode, _ state: Int) {
        self.node = node
        self.state = state
    }
}

func allTraversals(_ root: TreeNode?) -> ([Int], [Int], [Int]) {
    
    guard let root = root else {
        return ([], [], [])
    }
    
    var preorder = [Int]()
    var inorder = [Int]()
    var postorder = [Int]()
    
    var stack = [Pair]()
    
    // push root with state 1
    stack.append(Pair(root, 1))
    
    while !stack.isEmpty {
        
        let pair = stack.removeLast()
        let node = pair.node
        let state = pair.state
        
        if state == 1 {
            // Preorder stage
            preorder.append(node.val)
            
            // increment state and push back
            pair.state = 2
            stack.append(pair)
            
            // push left child
            if let left = node.left {
                stack.append(Pair(left, 1))
            }
            
        } else if state == 2 {
            // Inorder stage
            inorder.append(node.val)
            
            // increment state and push back
            pair.state = 3
            stack.append(pair)
            
            // push right child
            if let right = node.right {
                stack.append(Pair(right, 1))
            }
            
        } else {
            // Postorder stage
            postorder.append(node.val)
        }
    }
    
    return (preorder, inorder, postorder)
}
