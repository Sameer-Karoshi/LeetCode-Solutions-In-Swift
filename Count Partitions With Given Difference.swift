class Solution {

    // ============================================
    // Convert difference problem → subset sum = s2
    // ============================================
    func countPartitionsWithDiff(_ arr: [Int], _ diff: Int) -> Int {

        let total = arr.reduce(0, +)

        // s2 must be (total - diff)/2
        if (total - diff) < 0 || (total - diff) % 2 != 0 {
            return 0
        }

        let s2 = (total - diff) / 2

        // Use any approach:

        // 1️⃣ Recursion
        // return countSubsetsRecursion(arr, arr.count - 1, s2)

        // 2️⃣ Memoization
        var dp = Array(repeating: Array(repeating: -1, count: s2 + 1),
                       count: arr.count)
        return countSubsetsMemo(arr, arr.count - 1, s2, &dp)

        // 3️⃣ Tabulation
        // return countSubsetsTab(arr, s2)

        // 4️⃣ Space optimized
        // return countSubsetsSpaceOpt(arr, s2)
    }





    // ===========================================================
    // 1️⃣ RECURSION — Count subsets that sum to s2
    // ===========================================================
    func countSubsetsRecursion(_ arr: [Int], _ idx: Int, _ target: Int) -> Int {

        if idx == 0 {
            if target == 0 { return 1 }
            return arr[0] == target ? 1 : 0
        }

        let notTake = countSubsetsRecursion(arr, idx - 1, target)

        var take = 0
        if arr[idx] <= target {
            take = countSubsetsRecursion(arr, idx - 1, target - arr[idx])
        }

        return take + notTake
    }





    // ===========================================================
    // 2️⃣ MEMOIZATION — Top-down DP
    // ===========================================================
    func countSubsetsMemo(_ arr: [Int], _ idx: Int, _ target: Int,
                          _ dp: inout [[Int]]) -> Int {

        if idx == 0 {
            if target == 0 { return 1 }
            return arr[0] == target ? 1 : 0
        }

        if dp[idx][target] != -1 {
            return dp[idx][target]
        }

        let notTake = countSubsetsMemo(arr, idx - 1, target, &dp)

        var take = 0
        if arr[idx] <= target {
            take = countSubsetsMemo(arr, idx - 1, target - arr[idx], &dp)
        }

        dp[idx][target] = take + notTake
        return dp[idx][target]
    }





    // ===========================================================
    // 3️⃣ TABULATION — Bottom-up DP
    // ===========================================================
    func countSubsetsTab(_ arr: [Int], _ target: Int) -> Int {

        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: target + 1),
                       count: n)

        // base: sum = 0
        for i in 0..<n {
            dp[i][0] = 1
        }

        // first element
        if arr[0] <= target {
            dp[0][arr[0]] = 1
        }

        for i in 1..<n {
            for t in 0...target {

                let notTake = dp[i - 1][t]

                var take = 0
                if arr[i] <= t {
                    take = dp[i - 1][t - arr[i]]
                }

                dp[i][t] = take + notTake
            }
        }

        return dp[n - 1][target]
    }





    // ===========================================================
    // 4️⃣ SPACE OPTIMIZED DP — 1D array
    // ===========================================================
    func countSubsetsSpaceOpt(_ arr: [Int], _ target: Int) -> Int {

        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1

        if arr[0] <= target {
            dp[arr[0]] += 1
        }

        for i in 1..<arr.count {

            var curr = dp

            for t in 0...target {

                let notTake = dp[t]

                var take = 0
                if arr[i] <= t {
                    take = dp[t - arr[i]]
                }

                curr[t] = take + notTake
            }

            dp = curr
        }

        return dp[target]
    }
}
