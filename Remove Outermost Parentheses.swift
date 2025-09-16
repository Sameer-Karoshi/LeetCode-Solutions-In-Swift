class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var result = ""
        var depth = 0

        for char in s {
            if char == "(" {
                if depth > 0 {
                    result.append(char)
                }
                depth += 1
            } else if char == ")" {
                depth -= 1
                if depth > 0 {
                    result.append(char)
                }
            }
        }
        return result
    }
}
