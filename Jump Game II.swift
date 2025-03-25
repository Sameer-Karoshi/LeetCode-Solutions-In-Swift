class Solution {
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return 0
        }

        // Applying BFS

        var minimumJumps = 0
        var left = 0
        var right = 0

        while right < n - 1 {
            var farthest = 0
            for i in left...right {
                farthest = max(farthest, nums[i] + i)
            }

            left = right + 1
            right = farthest
            minimumJumps += 1
        }

        return minimumJumps
    }
}
