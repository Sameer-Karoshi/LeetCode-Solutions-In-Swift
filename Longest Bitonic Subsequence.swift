class Solution {
    
    // Function to find the length of the Longest Bitonic Subsequence
    func longestBitonicSubsequence(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        
        // dp1[i] = Length of LIS ending at index i
        var dp1 = Array(repeating: 1, count: n)
        
        // dp2[i] = Length of LDS starting at index i
        var dp2 = Array(repeating: 1, count: n)
        
        // -----------------------------
        // Step 1: Compute LIS from left
        // -----------------------------
        for i in 0..<n {
            for prev in 0..<i {
                // If current element is greater, we can extend LIS
                if nums[prev] < nums[i] {
                    dp1[i] = max(dp1[i], dp1[prev] + 1)
                }
            }
        }
        
        // --------------------------------
        // Step 2: Compute LDS from right
        // (Reverse LIS logic)
        // --------------------------------
        for i in stride(from: n - 1, through: 0, by: -1) {
            for next in stride(from: n - 1, to: i, by: -1) {
                // If current element is greater than next,
                // we can extend decreasing subsequence
                if nums[next] < nums[i] {
                    dp2[i] = max(dp2[i], dp2[next] + 1)
                }
            }
        }
        
        // --------------------------------
        // Step 3: Combine both LIS & LDS
        // --------------------------------
        var ans = 0
        for i in 0..<n {
            ans = max(ans, dp1[i] + dp2[i] - 1)
        }
        
        return ans
    }
}
