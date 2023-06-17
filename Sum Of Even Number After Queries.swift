class Solution {
    func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var nums = nums
        var result = [Int]()

        for query in queries {
            nums[query[1]] = nums[query[1]] + query[0]
            var evenSum = 0
            for num in nums {
                if num % 2 == 0 {
                    evenSum = evenSum + num
                }
            }
            result.append(evenSum)
        }
        return result
    }
}