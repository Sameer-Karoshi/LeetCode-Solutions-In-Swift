class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var localNums = nums
        localNums.sort()

        var answer: [[Int]] = []
        var ds: [Int] = []

        subsetsWithDupUsingRecursion(index: 0, nums: localNums, ds: &ds, answer: &answer)
        return answer
    }

    func subsetsWithDupUsingRecursion(index: Int, nums: [Int], ds: inout [Int], answer: inout [[Int]]) {
        answer.append(ds)

        for i in index..<nums.count {
            if i > index && nums[i] == nums[i - 1] {
                continue  // Skip duplicates
            }

            ds.append(nums[i])
            subsetsWithDupUsingRecursion(index: i + 1, nums: nums, ds: &ds, answer: &answer)
            ds.removeLast()
        }
    }
}
