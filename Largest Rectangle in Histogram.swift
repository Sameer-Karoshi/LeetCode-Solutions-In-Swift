class Solution {
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack: [Int] = []
        var maxArea = 0
        
        for i in 0...n {
            let currentHeight = (i == n) ? 0 : heights[i]
            
            while let last = stack.last, heights[last] > currentHeight {
                let idx = stack.removeLast()
                let height = heights[idx]
                
                // NSE = i
                // PSE = stack.last (after pop)
                let width = stack.last == nil ? i : i - stack.last! - 1
                maxArea = max(maxArea, height * width)
            }
            stack.append(i)
        }
        
        return maxArea
    }
}
