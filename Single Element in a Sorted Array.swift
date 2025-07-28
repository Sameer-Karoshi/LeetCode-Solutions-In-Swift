class Solution {
    // Better solution
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }

        var i = 0
        while i < nums.count - 1 {  
            if nums[i] != nums[i + 1] {
                return nums[i] 
            }

            i += 2 
        }
        
        return nums[nums.count - 1]
    }

    // Optimal Solution (Binary Search)
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count

        if n == 1 {
            return nums[0]
        }

        if nums[0] != nums[1] {
            return nums[0]
        }

        if nums[n - 1] != nums[n - 2] {
            return nums[n - 1]
        }

        var low = 1
        var high = n - 2

        while low <= high {
            let mid = (low + high) / 2

            if nums[mid] != nums[mid - 1] && nums[mid] != nums[mid + 1] {
                return nums[mid]
            }

            // if we are in left so eliminate left
            if ((mid % 2 == 1) && nums[mid] == nums[mid - 1]) || ((mid % 2 == 0) && nums[mid] == nums[mid + 1]) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return -1
    }
}
