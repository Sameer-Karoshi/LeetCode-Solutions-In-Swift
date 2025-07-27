class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let size = nums.count
        var left = 0
        var right = size - 1

        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] == target {
                return mid
            }

            if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        // left always lands on the first index where nums[left] >= target
        return left
    }
}
