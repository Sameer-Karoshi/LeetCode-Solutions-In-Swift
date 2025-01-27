class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        if n < 5 {
            return 0
        }

        var trailingZeroes = 0
        var n = n
        while n >= 5 {
            trailingZeroes += n / 5
            n = n / 5
        }
        return trailingZeroes
    }
}
