class Solution {

    // 🔹 1️⃣ Pure Recursion
    func matrixMultiplicationRecursive(_ arr: [Int], _ N: Int) -> Int {
        return solveRecursive(1, N - 1, arr)
    }

    func solveRecursive(_ i: Int, _ j: Int, _ arr: [Int]) -> Int {

        // Base case: only one matrix
        if i == j {
            return 0
        }

        var mini = Int.max

        // Try all partitions
        for k in i..<j {
            let steps = solveRecursive(i, k, arr)
                      + solveRecursive(k + 1, j, arr)
                      + arr[i - 1] * arr[k] * arr[j]

            mini = min(mini, steps)
        }

        return mini
    }

    // 🔹 2️⃣ Recursion + Memoization
    func matrixMultiplicationMemo(_ arr: [Int], _ N: Int) -> Int {

        var dp = Array(repeating: Array(repeating: -1, count: N), count: N)
        return solveMemo(1, N - 1, arr, &dp)
    }

    func solveMemo(_ i: Int, _ j: Int, _ arr: [Int], _ dp: inout [[Int]]) -> Int {

        // Base case
        if i == j {
            return 0
        }

        // Already computed
        if dp[i][j] != -1 {
            return dp[i][j]
        }

        var mini = Int.max

        for k in i..<j {
            let steps = solveMemo(i, k, arr, &dp)
                      + solveMemo(k + 1, j, arr, &dp)
                      + arr[i - 1] * arr[k] * arr[j]

            mini = min(mini, steps)
        }

        dp[i][j] = mini
        return mini
    }
}
