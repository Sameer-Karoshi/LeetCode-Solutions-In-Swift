class Solution {
    func isTrionic(_ nums: [Int]) -> Bool {
        guard nums.count >= 4 else { return false }

        var i = 1
        var inc1 = 0
        var dec = 0
        var inc2 = 0

        while i < nums.count && nums[i] > nums[i - 1] {
            inc1 += 1
            i += 1
        }

        while i < nums.count && nums[i] < nums[i - 1] {
            dec += 1
            i += 1
        }

        while i < nums.count && nums[i] > nums[i - 1] {
            inc2 += 1
            i += 1
        }

        return i == nums.count && inc1 > 0 && dec > 0 && inc2 > 0
    }
}
