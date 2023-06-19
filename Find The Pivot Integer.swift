class Solution {
    func pivotInteger(_ n: Int) -> Int {
        // first calculate all numbers sum :)
        var totalSum = (n * (n + 1)) / 2
        var leftSum: Int = 0
        for i in 1..<(n+1) {
            leftSum += i
            if leftSum == totalSum {
                return i
            }
            totalSum -= i
        }
        return -1
    }
}