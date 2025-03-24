class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        } 

        var remainingJumps = 0
        for i in 0..<nums.count {
            remainingJumps = remainingJumps - 1
            remainingJumps = max(remainingJumps, nums[i])
            if remainingJumps == 0 {
                return false
            } else if i + remainingJumps >= (nums.count - 1) {
                return true
            }
        }

        return false
    }
}
