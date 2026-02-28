// Tree Node Definition
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        
        if root == nil { return [] }
        
        // vertical -> level -> list of values
        var map = [Int: [Int: [Int]]]()
        
        // Queue -> (node, vertical, level)
        var queue: [(TreeNode, Int, Int)] = []
        queue.append((root!, 0, 0))
        
        var minCol = 0
        var maxCol = 0
        
        // BFS Traversal
        while !queue.isEmpty {
            
            let size = queue.count
            
            for _ in 0..<size {
                
                let (node, vertical, level) = queue.removeFirst()
                
                // Create structures if not present
                if map[vertical] == nil {
                    map[vertical] = [:]
                }
                
                if map[vertical]![level] == nil {
                    map[vertical]![level] = []
                }
                
                // Store node value
                map[vertical]![level]?.append(node.val)
                
                // Track column range
                minCol = min(minCol, vertical)
                maxCol = max(maxCol, vertical)
                
                // Left child
                if let left = node.left {
                    queue.append((left, vertical - 1, level + 1))
                }
                
                // Right child
                if let right = node.right {
                    queue.append((right, vertical + 1, level + 1))
                }
            }
        }
        
        var result: [[Int]] = []
        
        // Traverse columns from left → right
        for col in minCol...maxCol {
            
            var column: [Int] = []
            
            if let levels = map[col] {
                
                // Sort levels (top → bottom)
                let sortedLevels = levels.keys.sorted()
                
                for level in sortedLevels {
                    
                    // Sort overlapping nodes
                    let values = levels[level]!.sorted()
                    column.append(contentsOf: values)
                }
            }
            
            result.append(column)
        }
        
        return result
    }
}
