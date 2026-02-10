class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var farthest = 0   // stores the maximum index we can reach so far

        for i in 0..<nums.count {
            
            // If current index is beyond the farthest reachable index,
            // it means we are stuck and cannot move further
            if i > farthest {
                return false
            }

            // Update the farthest reachable index from current position
            farthest = max(farthest, i + nums[i])

            // If we can already reach or cross the last index, return true
            if farthest >= nums.count - 1 {
                return true
            }
        }

        // If loop completes, it means we never got stuck
        return true
    }
}
