class Solution {
    func countDigits(_ num: Int) -> Int {
        var count = 0
        var result = num
        while result >= 1 {
            let reminder = result % 10
            if num % reminder == 0 {
                count += 1
            }

            result = result / 10
        }

        return count
    }
}
