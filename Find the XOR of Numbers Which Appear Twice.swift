class Solution {
    func duplicateNumbersXOR(_ nums: [Int]) -> Int {
        var distinctNumbers: Set<Int> = []
        var xorResult = 0
        for num in nums {
            if distinctNumbers.contains(num) {
                xorResult = xorResult ^ num
            } else {
                distinctNumbers.insert(num)
            }
        }

        return xorResult
    }
}
