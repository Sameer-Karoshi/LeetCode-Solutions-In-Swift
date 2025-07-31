class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var size = nums.count
        var left = 1
        var right = size - 2

        // Edge cases
        if size == 1 {
            return 0
        }

        if nums[0] > nums[1] {
            return 0
        }

        if nums[size - 1] > nums[size - 2] {
            return size - 1
        }

        while left <= right {
            let mid = (left + right) / 2

            if (nums[mid] > nums[mid - 1]) && (nums[mid] > nums[mid + 1]) {
                return mid
            } else if nums[mid] < nums[mid + 1] {
                // increasing curve
                left = mid + 1
            } else {
                // decreasing curve
                right = mid - 1
            }
        }

        return -1 
    }
}
