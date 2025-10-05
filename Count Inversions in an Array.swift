class Solution {
    // Count inversions using merge sort
    func countInversions(_ nums: [Int]) -> Int {
        var arr = nums
        return mergeSort(&arr, 0, arr.count - 1)
    }

    private func mergeSort(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        if low >= high {
            return 0
        }

        let mid = (low + high) / 2
        var inversions = 0

        inversions += mergeSort(&nums, low, mid)
        inversions += mergeSort(&nums, mid + 1, high)
        inversions += merge(&nums, low, mid, high)

        return inversions
    }

    private func merge(_ nums: inout [Int], _ low: Int, _ mid: Int, _ high: Int) -> Int {
        var temp: [Int] = []
        var left = low
        var right = mid + 1
        var inversions = 0

        while left <= mid && right <= high {
            if nums[left] <= nums[right] {
                temp.append(nums[left])
                left += 1
            } else {
                // Inversion found: all elements from left...mid are greater than nums[right]
                inversions += (mid - left + 1)
                temp.append(nums[right])
                right += 1
            }
        }

        while left <= mid {
            temp.append(nums[left])
            left += 1
        }

        while right <= high {
            temp.append(nums[right])
            right += 1
        }

        for i in low...high {
            nums[i] = temp[i - low]
        }

        return inversions
    }
}
