class Solution {
    func reverseWords(_ s: String) -> String {
        let trimmedS = s.trimmingCharacters(in: .whitespaces)
        let fruits = trimmedS.split(separator: " ")
        var result = ""
        for fruit in fruits.reversed() {
            result += (fruit + " ")
        }

        return result.trimmingCharacters(in: .whitespaces)
    }
}
