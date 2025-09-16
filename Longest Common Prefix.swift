class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 {
            return strs[0]
        }

        var runningChars = ""
        for char in strs[0] {
            runningChars += String(char)
            for i in 1..<strs.count {
                if !strs[i].hasPrefix(runningChars) {
                    runningChars.removeLast()
                    return runningChars
                }
            }
        }

        return runningChars
    }
}
