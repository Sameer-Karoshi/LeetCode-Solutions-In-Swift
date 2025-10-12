class Solution {

    // MARK: - 1. Recursive Approach (Top-down without memoization)
    // Time Complexity: Exponential O(3^n), not efficient for large inputs
    func ninjaTrainingRecursive(_ day: Int, _ last: Int, _ points: [[Int]]) -> Int {
        // Base case: on the first day, choose any task except the one done 'last'
        if day == 0 {
            var maxPoints = 0
            for task in 0..<3 where task != last {
                maxPoints = max(maxPoints, points[0][task])
            }
            return maxPoints
        }

        var maxPoints = 0
        // Try all tasks that are not equal to the last task
        for task in 0..<3 where task != last {
            let currentPoints = points[day][task] + ninjaTrainingRecursive(day - 1, task, points)
            maxPoints = max(maxPoints, currentPoints)
        }

        return maxPoints
    }

    // MARK: - 2. Memoization Approach (Top-down with caching)
    // Time Complexity: O(n * 4), Space: O(n * 4) + Recursion Stack
    func ninjaTrainingMemo(_ day: Int, _ last: Int, _ points: [[Int]], _ dp: inout [[Int]]) -> Int {
        // Return cached result if already computed
        if dp[day][last] != -1 {
            return dp[day][last]
        }

        // Base case
        if day == 0 {
            var maxPoints = 0
            for task in 0..<3 where task != last {
                maxPoints = max(maxPoints, points[0][task])
            }
            dp[day][last] = maxPoints
            return maxPoints
        }

        var maxPoints = 0
        for task in 0..<3 where task != last {
            let currentPoints = points[day][task] + ninjaTrainingMemo(day - 1, task, points, &dp)
            maxPoints = max(maxPoints, currentPoints)
        }

        // Store result in dp table
        dp[day][last] = maxPoints
        return maxPoints
    }

    // MARK: - 3. Tabulation Approach (Bottom-up DP)
    // Time Complexity: O(n * 4 * 3), Space: O(n * 4)
    func ninjaTrainingTabulation(_ points: [[Int]]) -> Int {
        let n = points.count
        // dp[day][last]: max points on 'day' if last task done was 'last'
        var dp = Array(repeating: Array(repeating: 0, count: 4), count: n)

        // Base case: fill for day 0
        for last in 0...3 {
            var maxPoints = 0
            for task in 0..<3 where task != last {
                maxPoints = max(maxPoints, points[0][task])
            }
            dp[0][last] = maxPoints
        }

        // Fill the DP table for each day
        for day in 1..<n {
            for last in 0...3 {
                var maxPoints = 0
                for task in 0..<3 where task != last {
                    let currentPoints = points[day][task] + dp[day - 1][task]
                    maxPoints = max(maxPoints, currentPoints)
                }
                dp[day][last] = maxPoints
            }
        }

        // Result is maximum points on last day with no previous task (3)
        return dp[n - 1][3]
    }

    // MARK: - 4. Space Optimized DP
    // Time Complexity: O(n * 4 * 3), Space: O(4)
    func ninjaTrainingSpaceOptimized(_ points: [[Int]]) -> Int {
        let n = points.count
        // prev[last]: max points up to previous day with 'last' task
        var prev = Array(repeating: 0, count: 4)

        // Base case for day 0
        for last in 0...3 {
            var maxPoints = 0
            for task in 0..<3 where task != last {
                maxPoints = max(maxPoints, points[0][task])
            }
            prev[last] = maxPoints
        }

        // Iterate over days
        for day in 1..<n {
            var curr = Array(repeating: 0, count: 4)
            for last in 0...3 {
                var maxPoints = 0
                for task in 0..<3 where task != last {
                    let currentPoints = points[day][task] + prev[task]
                    maxPoints = max(maxPoints, currentPoints)
                }
                curr[last] = maxPoints
            }
            // Update prev for next day
            prev = curr
        }

        // Final result is for last day with no prior task (3)
        return prev[3]
    }
}
