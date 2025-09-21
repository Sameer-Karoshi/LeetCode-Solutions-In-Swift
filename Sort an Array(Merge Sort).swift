class Solution {
    // Merge sort
    func sortArray(_ nums: [Int]) -> [Int] {
        var resultArray = nums
        merge(nums: &resultArray, low: 0, high: resultArray.count - 1)
        return resultArray
    }

    private func merge(nums: inout [Int], low: Int, high: Int) {
        // Base Case
        if low == high {
            return 
        }

        let mid = (low + high) / 2
        merge(nums: &nums, low: low, high: mid)
        merge(nums: &nums, low: mid + 1, high: high)
        merge(nums: &nums, low: low, mid: mid, high: high)
    }

    private func merge(nums: inout [Int], low: Int, mid: Int, high: Int) {
        var tempArray: [Int] = []

        var left = low
        var right = mid + 1

        while (left <= mid && right <= high) {
            if (nums[left] <= nums[right]) {
                tempArray.append(nums[left])
                left += 1
            } else {
                tempArray.append(nums[right])
                right += 1
            }
        }

        while left <= mid {
            tempArray.append(nums[left])
            left += 1
        }

        while right <= high {
            tempArray.append(nums[right])
            right += 1
        }

        for i in low...high {
            nums[i] = tempArray[i - low]
        }
    }
}
