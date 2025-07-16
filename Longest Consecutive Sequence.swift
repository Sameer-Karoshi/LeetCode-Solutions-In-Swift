class Solution {
    // Brute force
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        var localNums = nums
        localNums.sort()
        var count = 1
        var maxCount = 1
        var i = 0

        while i < nums.count - 1 {
            if localNums[i] == (localNums[i + 1] - 1) {
                count = count + 1
                maxCount = max(maxCount, count) 
            } else if localNums[i] != localNums[i + 1] {
                count = 1
            }

            i = i + 1
        }

        return maxCount
    }

    // Optimal
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set(nums)
        var maxLength = 0

        for num in numSet {
            // start element
            if !numSet.contains(num - 1) {
                var currentLength = 1
                var currentNum = num

                while numSet.contains(currentNum + 1) {
                    currentLength = currentLength + 1
                    currentNum = currentNum + 1
                }

                maxLength = max(maxLength, currentLength)
            }
        }

        return maxLength
    }
    
}
