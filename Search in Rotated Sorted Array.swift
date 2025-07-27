class Solution {
    
    // O(n + log n) approach
    func search(_ nums: [Int], _ target: Int) -> Int {
        var localNums = nums
        let size = localNums.count 
        var kIndex = 0
        
        for i in 1..<size {
            if localNums[i - 1] > localNums[i] {
                kIndex = i
                break
            }
        }

        let leftArrayRes = binarySearch(localNums, target, 0, kIndex - 1)
        let rightArrayRes = binarySearch(localNums, target, kIndex, size - 1)

        return max(leftArrayRes, rightArrayRes)
    }

    func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right

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

        return -1
    }

    // O(log n) approach
    func searchOptimized(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] == target {
                return mid
            }

            // Left half is sorted
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            // Right half is sorted
            else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }

        return -1
    }
}
