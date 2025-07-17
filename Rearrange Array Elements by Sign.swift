class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var localNums = nums
        var positiveIndex = 0
        var negativeIndex = 1
        
        // Two pointers approach
        for num in localNums {
            if num > 0 {
                localNums[positiveIndex] = num
                positiveIndex += 2
            } else {
                localNums[negativeIndex] = num
                negativeIndex += 2
            }
        }
        
        return localNums
    }
}

