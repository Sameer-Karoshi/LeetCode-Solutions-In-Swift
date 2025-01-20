class Solution {
    func sortColors(_ nums: inout [Int]) {
        // three way partition algorithm (Dutch national flag algo)

        var low = 0
        var mid = 0
        var high = nums.count - 1

        while(mid <= high) {
            if nums[mid] == 0 {
                swap(nums: &nums, i: low, j: mid)
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                swap(nums: &nums, i: mid, j: high)
                high -= 1
            }
        } 
    }

    private func swap(nums: inout [Int], i: Int, j: Int) {
        var temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
