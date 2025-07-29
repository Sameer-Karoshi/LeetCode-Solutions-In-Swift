class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // Lower bound
        func findFirst(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            var index = -1

            while left <= right {
                let mid = (left + right) / 2
                if nums[mid] == target {
                    index = mid
                    right = mid - 1  // Keep searching to the left
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return index
        }


        // Upper bound

        func findLast(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            var index = -1

            while left <= right {
                let mid = (left + right) / 2
                if nums[mid] == target {
                    index = mid
                    left = mid + 1  // Keep searching to the right
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return index
        }

        let first = findFirst(nums, target)
        let last = findLast(nums, target)

        return [first, last]
    }
}
