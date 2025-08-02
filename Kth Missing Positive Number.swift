class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var size = arr.count
        var low = 0
        var high = size - 1

        while low <= high {
            let mid = (low + high) / 2
            let missing = arr[mid] - (mid + 1)
            if missing < k {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return high + 1 + k
    }
}
