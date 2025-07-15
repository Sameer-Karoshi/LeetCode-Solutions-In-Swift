class Solution {
    // Brute force
    func check(_ nums: [Int]) -> Bool {
        if nums.count <= 1 {
            return true
        }

        let n = nums.count

        for i in 1..<n {
            // Check if [0..<i] is non-decreasing
            var isFirstPartSorted = true
            for j in 1..<i {
                if nums[j] < nums[j - 1] {
                    isFirstPartSorted = false
                    break
                }
            }

            // Check if [i..<n] is non-decreasing
            var isSecondPartSorted = true
            for k in i + 1..<n {
                if nums[k] < nums[k - 1] {
                    isSecondPartSorted = false
                    break
                }
            }

            // Check the rotation connection point: last and first
            if isFirstPartSorted && isSecondPartSorted && nums[n - 1] <= nums[0] {
                return true
            }
        }

        // Check if the whole array is already sorted
        for i in 1..<n {
            if nums[i] < nums[i - 1] {
                return false
            }
        }

        return true
    }

    // Optimal (Sliding window)
    func check(_ nums: [Int]) -> Bool {
        var size = nums.count
        var count = 1

        for i in 1..<nums.count * 2 {
            if nums[(i-1) % size] <= nums[i % size] {
                count = count + 1
            } else {
                count = 1 
            }

            if count == size {
                return true
            }
        }

        return size == 1
    }

}
