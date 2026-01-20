class Solution {
    
    // Main function
    func longestStrChain(_ words: [String]) -> Int {
        
        // Step 1: Sort words based on length (ascending)
        let sortedWords = words.sorted { $0.count < $1.count }
        
        let n = sortedWords.count
        
        // dp[i] = longest string chain ending at index i
        var dp = Array(repeating: 1, count: n)
        
        var maxChain = 1
        
        // Step 2: Apply LIS-style DP
        for i in 0..<n {
            for prev in 0..<i {
                
                // If prev word can be predecessor of current word
                if isPredecessor(sortedWords[prev], sortedWords[i]) {
                    dp[i] = max(dp[i], dp[prev] + 1)
                }
            }
            maxChain = max(maxChain, dp[i])
        }
        
        return maxChain
    }
    
    // Helper function to check if s1 is predecessor of s2
    // s2 should be exactly 1 character longer than s1
    private func isPredecessor(_ s1: String, _ s2: String) -> Bool {
        
        // Length condition
        if s2.count != s1.count + 1 {
            return false
        }
        
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        
        var i = 0  // pointer for s1
        var j = 0  // pointer for s2
        var mismatchUsed = false
        
        while i < arr1.count && j < arr2.count {
            if arr1[i] == arr2[j] {
                i += 1
                j += 1
            } else {
                // We can skip only one character in s2
                if mismatchUsed {
                    return false
                }
                mismatchUsed = true
                j += 1
            }
        }
        
        return true
    }
}
