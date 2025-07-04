class Solution {
    func reverse(_ x: Int) -> Int {
        var localX = x
        var result = 0
        while localX != 0 {
            let reminder = localX % 10
            result = result * 10 + reminder
            localX = localX / 10
        }

        if result > Int32.max || result < Int32.min {
            return 0
        }

        return result
    }
}
