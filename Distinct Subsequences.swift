class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        
        let n = sArr.count
        let m = tArr.count
        
        // dp[j] = number of ways to form t[0...j-1]
        var dp = Array(repeating: 0, count: m + 1)
        
        // Base case: empty t
        dp[0] = 1
        
        for i in 1...n {
            // Traverse backwards
            if m > 0 {
                for j in stride(from: m, through: 1, by: -1) {
                    if sArr[i - 1] == tArr[j - 1] {
                        dp[j] += dp[j - 1]
                    }
                }
            }
        }
        
        return dp[m]
    }
}
