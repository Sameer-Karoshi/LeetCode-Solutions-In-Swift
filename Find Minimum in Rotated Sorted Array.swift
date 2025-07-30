class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var size = nums.count

        while left <= right {
            let mid = (left + right) / 2

            if mid + 1 < size && nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }

            // left half is sorted (Eliminate the sorted part since non-sorted part will have minimum)
            if nums[left] <= nums[mid] {
                left = mid + 1
            } 
            // right half is sorted
            else {
                right = mid - 1
            }
        }

        return nums[0]
    }
}
