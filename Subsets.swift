class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var resultArray: [[Int]] = []
        var tempArray: [Int] = []
        generateSubsets(index: 0, nums: nums, tempArray: &tempArray, resultArray: &resultArray)
        return resultArray
    }

    private func generateSubsets(index: Int, nums: [Int], tempArray: inout [Int], resultArray: inout [[Int]]) {
        if index == nums.count {
            resultArray.append(tempArray)
            return
        }

        // Pick the current element
        tempArray.append(nums[index])
        generateSubsets(index: index + 1, nums: nums, tempArray: &tempArray, resultArray: &resultArray)
        tempArray.removeLast() // Backtrack

        // Do not pick the current element
        generateSubsets(index: index + 1, nums: nums, tempArray: &tempArray, resultArray: &resultArray)
    }
}
