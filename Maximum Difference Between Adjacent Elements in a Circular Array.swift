class Solution {
    func maxAdjacentDistance(_ nums: [Int]) -> Int {
        var maxDistance = Int.min
        for i in 1..<nums.count {
            if abs(nums[i] - nums[i-1]) > maxDistance {
                maxDistance = abs(nums[i] - nums[i-1])
            }
        }

        if abs(nums[nums.count-1] - nums[0]) > maxDistance {
            maxDistance = abs(nums[nums.count-1] - nums[0])
        }

        return maxDistance
    }
}
