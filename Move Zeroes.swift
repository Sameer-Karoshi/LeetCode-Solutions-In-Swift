class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }

        var i = 0
        var size = nums.count
        while i < size {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
                size = size - 1 
            } else {
                i = i + 1
            }
        }
    }
}
