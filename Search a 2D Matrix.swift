class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let oneDArray = matrix.flatMap { $0 }

        // Binary Search
        var left = 0
        var right = oneDArray.count - 1

        while left <= right {
            let mid = (left + right) / 2
            if oneDArray[mid] == target {
                return true
            } else if oneDArray[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
