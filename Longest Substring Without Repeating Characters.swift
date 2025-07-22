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

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map: [Character: String.Index] = [:]
        var result = 0
        var left = s.startIndex
        var right = s.startIndex

        while right < s.endIndex {
            let char = s[right]

            if let prevIndex = map[char], prevIndex >= left {
                left = s.index(after: prevIndex)
            }

            map[char] = right
            let length = s.distance(from: left, to: right) + 1
            result = max(result, length)

            right = s.index(after: right)
        }

        return result
    }
}
