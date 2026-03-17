/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

final class Codec {
    
    // MARK: - Serialize (BFS)
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        
        var result: [String] = []
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let node = node {
                result.append(String(node.val))
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append("#")
            }
        }
        
        return result.joined(separator: ",")
    }
    
    
    // MARK: - Deserialize (FOR LOOP + INDEX)
    func deserialize(_ data: String) -> TreeNode? {
        // "1,2,3,#,#,4,5,#,#,#,#"
        guard !data.isEmpty else { return nil }
        
        let values = data.split(separator: ",").map(String.init)
        
        // Root at index 0
        guard let rootVal = Int(values[0]) else { return nil }
        let root = TreeNode(rootVal)
        
        var queue: [TreeNode] = [root]
        var qIndex = 0   // Pointer for queue
        
        // Iterate from index 1 with step 2 (left + right)
        for i in stride(from: 1, to: values.count, by: 2) {
            // Safety: stop if no more parent nodes
            if qIndex >= queue.count { break }
            
            let current = queue[qIndex]
            qIndex += 1
            
            // LEFT child (i)
            if let val = Int(values[i]) {
                let leftNode = TreeNode(val)
                current.left = leftNode
                queue.append(leftNode)
            }
            
            // RIGHT child (i + 1)
            if i + 1 < values.count, let val = Int(values[i + 1]) {
                let rightNode = TreeNode(val)
                current.right = rightNode
                queue.append(rightNode)
            }
        }
        
        return root
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
