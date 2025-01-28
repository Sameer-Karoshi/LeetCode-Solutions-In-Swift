class Solution {
    // Lets solve this using recursion
    var i = -1
    func isPalindrome(_ x: Int) -> Bool {
        i += 1
        if i >= String(x).count / 2 {
            return true
        }

        if String(x)[String(x).index(String(x).startIndex, offsetBy: i)] != String(x)[String(x).index(String(x).startIndex, offsetBy: String(x).count - i - 1)] {
            return false
        }

        return isPalindrome(x)
    }
}
