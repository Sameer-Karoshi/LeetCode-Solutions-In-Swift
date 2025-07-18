class Solution {
    // Brute force
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum = sum + nums[j]

                if sum == k {
                    result = result + 1
                } 
            }
        }

        return result
    }

    // Optimized
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var prefixSums: [Int: Int] = [0: 1]

        for num in nums {
            sum += num
            if let freq = prefixSums[sum - k] {
                count += freq
            }

            prefixSums[sum, default: 0] += 1
        }

        return count
    }
}
