class Solution {
    func maxDepth(_ s: String) -> Int {
        var count = 0
        var maxResult = Int.min
        for char in s {
            if char == "(" {
                count += 1
            } else if char == ")" {
                count -= 1
            }

            maxResult = max(count, maxResult)
        }

        return maxResult
    }
}
