class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        for i in 1..<(nums.count + 1) {
            if !nums.contains(i) {
                return i
            }
        }

        return 0
    }
}
