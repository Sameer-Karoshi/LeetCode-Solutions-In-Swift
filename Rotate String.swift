class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }

        var temp = s
        for _ in s {
            let firstChar = temp.first!
            temp = String(temp.dropFirst()) + String(firstChar)
            if temp == goal {
                return true
            }
        }

        return false
    }
}
