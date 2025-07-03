class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        
        // Step 1: Find the breakpoint (the largest index i such that nums[i] < nums[i + 1])
        var index = -1
        for i in stride(from: n - 2, through: 0, by: -1) {
            if nums[i] < nums[i + 1] {
                index = i
                break
            }
        }
        
        // Step 2: If no breakpoint found, reverse the array because it's the last permutation
        if index == -1 {
            nums.reverse()
            return
        }
        
        // Step 3: Find the smallest number in the right of `index` that is larger than nums[index]
        for i in stride(from: n - 1, through: index + 1, by: -1) {
            if nums[index] < nums[i] {
                nums.swapAt(index, i)
                break
            }
        }
        
        // Step 4: Reverse the subarray after `index` to get the next permutation
        var left = index + 1
        var right = n - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
