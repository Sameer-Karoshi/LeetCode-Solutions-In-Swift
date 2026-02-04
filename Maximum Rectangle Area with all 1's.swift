class Solution {
    
    // MAIN METHOD
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        // If matrix is empty, no rectangle possible
        if matrix.isEmpty { return 0 }
        
        let n = matrix.count
        let m = matrix[0].count
        
        // This array stores histogram heights for current row
        var heights = Array(repeating: 0, count: m)
        var ans = 0
        
        // Traverse each row
        for i in 0..<n {
            for j in 0..<m {
                // If current cell is '1', extend histogram height
                // Else reset height to 0 (rectangle can't continue)
                heights[j] = matrix[i][j] == "1" ? heights[j] + 1 : 0
            }
            
            // For every row-histogram, find max rectangle area
            ans = max(ans, largestRectangle(heights))
        }
        
        return ans
    }
    
    // HELPER METHOD: Largest Rectangle in Histogram (Single-pass stack)
    private func largestRectangle(_ heights: [Int]) -> Int {
        var stack = [Int]()   // Stores indices of bars in increasing order
        var maxArea = 0
        let n = heights.count
        
        // Loop till n, and one extra iteration to flush stack
        for i in 0...n {
            // At i == n, we use height = 0 to pop all remaining bars
            let currHeight = (i == n) ? 0 : heights[i]
            
            // If current bar is smaller, we finalize rectangles
            while !stack.isEmpty && currHeight < heights[stack.last!] {
                let h = heights[stack.removeLast()]   // Height of rectangle
                let right = i                        // Right boundary
                let left = stack.isEmpty ? -1 : stack.last! // Left boundary
                let width = right - left - 1         // Width between boundaries
                maxArea = max(maxArea, h * width)    // Update max area
            }
            
            // Push current index to stack
            stack.append(i)
        }
        
        return maxArea
    }
}
