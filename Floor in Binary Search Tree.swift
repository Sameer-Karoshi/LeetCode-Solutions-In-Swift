class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int) {
        self.data = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func findFloor(_ root: Node?, _ key: Int) -> Int {
        var current = root
        var floor = -1
        
        while let node = current {
            
            // Exact match
            if node.data == key {
                return node.data
            }
            
            if node.data > key {
                // Move left
                current = node.left
            } else {
                // Potential floor
                floor = node.data
                
                // Move right for a better candidate
                current = node.right
            }
        }
        
        return floor
    }
}
