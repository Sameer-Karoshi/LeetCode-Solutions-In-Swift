class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentSum = 0
        var maxSum = -10000

        for num in nums {
            currentSum += num
            maxSum = max(maxSum, currentSum)

            if currentSum < 0 {
                currentSum = 0
            }
        }

        return maxSum
    }
}
