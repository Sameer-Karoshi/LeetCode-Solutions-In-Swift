class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    
    // If tree is empty
    guard let rootNode = root else { return 0 }
    
    var queue: [(node: TreeNode, index: Int)] = [(rootNode, 0)]
    var maxWidth = 0
    
    while !queue.isEmpty {
        
        let size = queue.count
        
        // safely get first index
        guard let firstIndex = queue.first?.index else { return maxWidth }
        
        var first = 0
        var last = 0
        
        for i in 0..<size {
            
            let element = queue.removeFirst()
            let node = element.node
            
            // normalize index
            let currentIndex = element.index - firstIndex
            
            if i == 0 { first = currentIndex }
            if i == size - 1 { last = currentIndex }
            
            if let leftNode = node.left {
                queue.append((leftNode, 2 * currentIndex))
            }
            
            if let rightNode = node.right {
                queue.append((rightNode, 2 * currentIndex + 1))
            }
        }
        
        let width = last - first + 1
        maxWidth = max(maxWidth, width)
    }
    
    return maxWidth
}
