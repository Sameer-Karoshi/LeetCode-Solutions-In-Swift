// Tree Node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

func topView(_ root: TreeNode?) -> [Int] {
    
    // Edge case
    guard let root = root else { return [] }
    
    // Queue -> (node, horizontal distance)
    var queue: [(TreeNode, Int)] = [(root, 0)]
    
    // hd -> node value
    var map: [Int: Int] = [:]
    
    while !queue.isEmpty {
        let (node, hd) = queue.removeFirst()
        
        // Store only first node seen at this vertical
        if map[hd] == nil {
            map[hd] = node.val
        }
        
        if let leftNode = node.left {
            queue.append((leftNode, hd - 1))
        }
        
        if let rightNode = node.right {
            queue.append((rightNode, hd + 1))
        }
    }
    
    // Sort horizontal distances
    let sortedKeys = map.keys.sorted()
    
    var result: [Int] = []
    
    for key in sortedKeys {
        if let value = map[key] {   // ✅ no force unwrap
            result.append(value)
        }
    }
    
    return result
}
