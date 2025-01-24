class Solution {
    func isBalanced(_ num: String) -> Bool {
        var evenSum = 0
        var oddSum = 0

        for(index, char) in num.enumerated() {
            if index % 2 == 0 {
                evenSum += Int(String(char)) ?? 0
            } else {
                oddSum += Int(String(char)) ?? 0
            }
        }

        return evenSum == oddSum
    }
}
