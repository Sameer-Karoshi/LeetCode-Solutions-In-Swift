class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var set: Set<Character> = []
        var result = 0
        var left = s.startIndex
        var right = s.startIndex

        while right < s.endIndex {
            let char = s[right]
            if set.contains(char) {
                // Remove the leftmost character and move left pointer forward
                set.remove(s[left])
                left = s.index(after: left)
            } else {
                set.insert(char)
                result = max(result, set.count)
                right = s.index(after: right)
            }
        }

        return result
    }
}
