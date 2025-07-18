class Solution {
    // Brute force
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count == 1 {
            return
        }

        var numberOfItemsToPutAtEnd = nums.count - (k % nums.count)

        for _ in 0..<numberOfItemsToPutAtEnd {
            let item = nums[0]
            nums.remove(at: 0)
            nums.append(item)
        }
    }

    // Optimal
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n  // handle cases where k >= n

        // Helper to reverse a portion of the array in-place
        func reverse(_ start: Int, _ end: Int) {
            var left = start
            var right = end
            while left < right {
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }

        // Step 1: Reverse the first k elements
        reverse(0, n - k - 1)

        // Step 2: Reverse the remaining n-k elements
        reverse(n - k, n - 1)

        // Step 3: Reverse the entire array
        reverse(0, n - 1)
    }
}
