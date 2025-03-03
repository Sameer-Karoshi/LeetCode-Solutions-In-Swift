class Solution {
    func countPartitions(_ nums: [Int]) -> Int {
        var totalSum = 0
        for num in nums {
            totalSum += num
        }

        var count = 0
        var leftSum = 0
        for (index, num) in nums.enumerated() {
            if (index == nums.count - 1) {
                break
            }
    
            leftSum += num
            let rightSum = totalSum - leftSum
            if (leftSum-rightSum) % 2 == 0 {
                count += 1
            } 
        }

        return count
    }
}
