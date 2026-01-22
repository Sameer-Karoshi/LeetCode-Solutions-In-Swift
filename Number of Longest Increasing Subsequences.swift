class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        
        // dp[i] = length of LIS ending at index i
        var dp = Array(repeating: 1, count: n)
        
        // count[i] = number of LIS ending at index i
        var count = Array(repeating: 1, count: n)
        
        var maxLen = 1
        
        for i in 0..<n {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    
                    // Found longer subsequence
                    if dp[j] + 1 > dp[i] {
                        dp[i] = dp[j] + 1
                        count[i] = count[j]
                    }
                    // Found another way to get same max length
                    else if dp[j] + 1 == dp[i] {
                        count[i] += count[j]
                    }
                }
            }
            maxLen = max(maxLen, dp[i])
        }
        
        // Sum counts of all indices having LIS length = maxLen
        var result = 0
        for i in 0..<n {
            if dp[i] == maxLen {
                result += count[i]
            }
        }
        
        return result
    }
}
