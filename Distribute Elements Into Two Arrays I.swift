class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        var array1 = [Int]()
        var array2 = [Int]()

        array1.append(nums[0])
        array2.append(nums[1])
        for i in 2..<nums.count {
            if array1[array1.count-1] > array2[array2.count-1] {
                array1.append(nums[i])
            } else {
                array2.append(nums[i])
            }
        }
        return array1 + array2
    }
}
