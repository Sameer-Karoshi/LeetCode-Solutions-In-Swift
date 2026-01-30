class Solution {

    // MARK: - 1. Recursion (TLE - for understanding)

    func maxCoinsRec(_ nums: [Int]) -> Int {
        var arr = [1] + nums + [1]
        let n = nums.count
        return solveRec(1, n, arr)
    }

    private func solveRec(_ i: Int, _ j: Int, _ arr: [Int]) -> Int {
        if i > j { return 0 }

        var maxi = 0
        for k in i...j {
            let coins = arr[i - 1] * arr[k] * arr[j + 1]
                      + solveRec(i, k - 1, arr)
                      + solveRec(k + 1, j, arr)
            maxi = max(maxi, coins)
        }
        return maxi
    }

    // MARK: - 2. Memoization (Top-Down)

    func maxCoinsMemo(_ nums: [Int]) -> Int {
        var arr = [1] + nums + [1]
        let n = nums.count
        var dp = Array(repeating: Array(repeating: -1, count: n + 2), count: n + 2)
        return solveMemo(1, n, arr, &dp)
    }

    private func solveMemo(_ i: Int, _ j: Int, _ arr: [Int], _ dp: inout [[Int]]) -> Int {
        if i > j { return 0 }
        if dp[i][j] != -1 { return dp[i][j] }

        var maxi = 0
        for k in i...j {
            let coins = arr[i - 1] * arr[k] * arr[j + 1]
                      + solveMemo(i, k - 1, arr, &dp)
                      + solveMemo(k + 1, j, arr, &dp)
            maxi = max(maxi, coins)
        }
        dp[i][j] = maxi
        return maxi
    }

    // MARK: - 3. Tabulation (Bottom-Up) ✅ Best for interviews

    func maxCoins(_ nums: [Int]) -> Int {
        var arr = [1] + nums + [1]
        let n = nums.count

        // dp[i][j] = max coins from bursting balloons i...j
        var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)

        // Length based filling (Striver style)
        for length in 1...n {
            for i in 1...(n - length + 1) {
                let j = i + length - 1
                var maxi = 0

                for k in i...j {
                    let coins = arr[i - 1] * arr[k] * arr[j + 1]
                              + dp[i][k - 1]
                              + dp[k + 1][j]
                    maxi = max(maxi, coins)
                }
                dp[i][j] = maxi
            }
        }

        return dp[1][n]
    }
}
