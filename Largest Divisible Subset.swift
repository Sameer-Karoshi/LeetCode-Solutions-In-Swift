class LargestDivisibleSubset {

    func printLargestDivisibleSubset(_ nums: [Int]) {
        let n = nums.count
        if n == 0 { return }

        // Step 0: Sort the array
        // Sorting ensures divisibility condition works like LIS
        let arr = nums.sorted()

        // dp[i] = length of largest divisible subset ending at index i
        var dp = Array(repeating: 1, count: n)

        // hash[i] = previous index in subset (for reconstruction)
        var hash = Array(repeating: 0, count: n)

        // Initially every element points to itself
        for i in 0..<n {
            hash[i] = i
        }

        var maxi = 1       // Length of largest divisible subset
        var lastIndex = 0  // Index where subset ends

        // Step 1: Fill dp and hash arrays
        for i in 0..<n {
            for prev in 0..<i {
                // Divisibility condition instead of increasing
                if arr[i] % arr[prev] == 0 && dp[prev] + 1 > dp[i] {
                    dp[i] = dp[prev] + 1
                    hash[i] = prev
                }
            }

            // Track maximum subset length
            if dp[i] > maxi {
                maxi = dp[i]
                lastIndex = i
            }
        }

        // Step 2: Reconstruct the subset using hash array
        var subset: [Int] = []
        subset.append(arr[lastIndex])

        // Move backwards using hash until self-loop
        while hash[lastIndex] != lastIndex {
            lastIndex = hash[lastIndex]
            subset.append(arr[lastIndex])
        }

        // Subset is built in reverse order
        subset.reverse()

        // Output
        print("Length of Largest Divisible Subset:", maxi)
        print("Largest Divisible Subset:", subset)
    }
}
