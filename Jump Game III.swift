class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arrCopy = arr
        return recursion(&arrCopy, start)
    }

    private func recursion(_ arr: inout [Int], _ i: Int) -> Bool {
        // Out of bounds or previously visited
        if i < 0 || i >= arr.count || arr[i] < 0 {
            return false
        }
        
        // Found zero
        if arr[i] == 0 {
            return true
        }
        
        arr[i] = -arr[i]   // mark visited
        return recursion(&arr, i + arr[i]) || recursion(&arr, i - arr[i])
    }
}
