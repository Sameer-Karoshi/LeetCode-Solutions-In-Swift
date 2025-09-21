class Solution {
    // Quick sort
    func sortArray(_ nums: [Int]) -> [Int] {
        var resultArray = nums
        quickSort(nums: &resultArray, low: 0, high: resultArray.count - 1)
        return resultArray
    }

    private func quickSort(nums: inout [Int], low: Int, high: Int) {
        if low <= high {
            let pIndex = partition(nums: &nums, low: low, high: high)
            quickSort(nums: &nums, low: low, high: pIndex - 1)
            quickSort(nums: &nums, low: pIndex + 1, high: high)
        }
    }

    private func partition(nums: inout [Int], low: Int, high: Int) -> Int {
        var pivot = nums[low]

        var i = low
        var j = high 

        while i < j {
            while (nums[i] <= pivot && i <= high - 1) {
                i += 1
            }

            while (nums[j] > pivot && j >= low + 1) {
                j -= 1
            }

            if i < j {
                nums.swapAt(j, i)
            }
        }

        nums.swapAt(low, j)
        return j
    }
}
