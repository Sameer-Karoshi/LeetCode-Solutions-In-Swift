class Solution {
    private let nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return nums
    }
    
    func shuffle() -> [Int] {
        var shuffledArray = [Int]()
        var leftArray = nums
        while !leftArray.isEmpty {
            let i = Int.random(in: 0...Int.max) % leftArray.count
            shuffledArray.append(leftArray[i])
            leftArray.remove(at: i)
        }
        return shuffledArray
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */