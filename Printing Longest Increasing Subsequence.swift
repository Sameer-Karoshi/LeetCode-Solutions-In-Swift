class LongestIncreasingSubsequence {

    func printLIS(_ arr: [Int]) {
        let n = arr.count
        if n == 0 { return }

        // dp[i] = length of LIS ending at index i
        var dp = Array(repeating: 1, count: n)

        // hash[i] = previous index in LIS (Striver style)
        var hash = Array(repeating: 0, count: n)

        // Initially every index points to itself
        for i in 0..<n {
            hash[i] = i
        }

        var maxi = 1       // Length of LIS
        var lastIndex = 0  // Ending index of LIS

        // Step 1: Fill dp and hash arrays
        for i in 0..<n {
            for prev in 0..<i {
                if arr[prev] < arr[i] && dp[prev] + 1 > dp[i] {
                    dp[i] = dp[prev] + 1
                    hash[i] = prev
                }
            }

            // Track maximum length LIS
            if dp[i] > maxi {
                maxi = dp[i]
                lastIndex = i
            }
        }

        // Step 2: Reconstruct LIS using hash array
        var lis: [Int] = []
        lis.append(arr[lastIndex])

        while hash[lastIndex] != lastIndex {
            lastIndex = hash[lastIndex]
            lis.append(arr[lastIndex])
        }

        // We built LIS in reverse order
        lis.reverse()

        // Output
        print("Length of LIS:", maxi)
        print("Longest Increasing Subsequence:", lis)
    }
}
