class Solution {

    // Convert Target Sum → Subset Sum (s1)
    private func getS1(_ nums: [Int], _ target: Int) -> Int? {
        let total = nums.reduce(0, +)

        if (total + target) % 2 != 0 || total < abs(target) {
            return nil
        }
        return (total + target) / 2
    }

    // MARK: - 1️⃣ RECURSION (Striver base-case)
    func recursion(_ nums: [Int], _ target: Int) -> Int {
        guard let s1 = getS1(nums, target) else { return 0 }
        return rec(nums, nums.count - 1, s1)
    }

    private func rec(_ nums: [Int], _ i: Int, _ sum: Int) -> Int {
        if i == 0 {
            if sum == 0 && nums[0] == 0 { return 2 }
            if sum == 0 || sum == nums[0] { return 1 }
            return 0
        }

        let notTake = rec(nums, i - 1, sum)
        let take = nums[i] <= sum ? rec(nums, i - 1, sum - nums[i]) : 0
        return take + notTake
    }

    // MARK: - 2️⃣ MEMOIZATION
    func memo(_ nums: [Int], _ target: Int) -> Int {
        guard let s1 = getS1(nums, target) else { return 0 }
        var dp = Array(repeating: Array(repeating: -1, count: s1 + 1), count: nums.count)
        return mem(nums, nums.count - 1, s1, &dp)
    }

    private func mem(_ nums: [Int], _ i: Int, _ sum: Int, _ dp: inout [[Int]]) -> Int {
        if i == 0 {
            if sum == 0 && nums[0] == 0 { return 2 }
            if sum == 0 || sum == nums[0] { return 1 }
            return 0
        }

        if dp[i][sum] != -1 { return dp[i][sum] }

        let notTake = mem(nums, i - 1, sum, &dp)
        let take = nums[i] <= sum ? mem(nums, i - 1, sum - nums[i], &dp) : 0

        dp[i][sum] = notTake + take
        return dp[i][sum]
    }

    // MARK: - 3️⃣ TABULATION
    func tabulation(_ nums: [Int], _ target: Int) -> Int {
        guard let s1 = getS1(nums, target) else { return 0 }

        let n = nums.count
        var dp = Array(repeating: Array(repeating: 0, count: s1 + 1), count: n)

        // Base case for index 0
        if nums[0] == 0 {
            dp[0][0] = 2
        } else {
            dp[0][0] = 1
        }

        if nums[0] != 0 && nums[0] <= s1 {
            dp[0][nums[0]] = 1
        }

        for i in 1..<n {
            for sum in 0...s1 {
                let notTake = dp[i - 1][sum]
                let take = nums[i] <= sum ? dp[i - 1][sum - nums[i]] : 0
                dp[i][sum] = notTake + take
            }
        }

        return dp[n - 1][s1]
    }

    // MARK: - 4️⃣ SPACE OPTIMIZED
    func spaceOpt(_ nums: [Int], _ target: Int) -> Int {
        guard let s1 = getS1(nums, target) else { return 0 }

        let n = nums.count
        var prev = Array(repeating: 0, count: s1 + 1)

        // Base case for index 0
        if nums[0] == 0 {
            prev[0] = 2
        } else {
            prev[0] = 1
        }

        if nums[0] != 0 && nums[0] <= s1 {
            prev[nums[0]] = 1
        }

        for i in 1..<n {
            var curr = Array(repeating: 0, count: s1 + 1)
            for sum in 0...s1 {
                let notTake = prev[sum]
                let take = nums[i] <= sum ? prev[sum - nums[i]] : 0
                curr[sum] = take + notTake
            }
            prev = curr
        }

        return prev[s1]
    }
}
