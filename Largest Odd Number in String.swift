class Solution {
    func largestOddNumber(_ num: String) -> String {
        var tempNum = num

        while !tempNum.isEmpty {
            if let lastChar = tempNum.last, let lastDigit = Int(String(lastChar)), lastDigit % 2 != 0 {
                return tempNum
            }
            tempNum.removeLast()
        }

        return ""
    }
}
