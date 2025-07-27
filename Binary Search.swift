class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var size = nums.count
        var left = 0
        var right = size - 1
        while left <= right {
            var mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }


            if target > nums[mid] {
                left = mid + 1
            } else if target < nums[mid] {
                right = mid - 1
            }
        }

        return -1
    }
}
