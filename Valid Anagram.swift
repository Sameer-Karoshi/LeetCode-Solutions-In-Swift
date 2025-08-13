class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // If lengths differ, they can't be anagrams
        if s.count != t.count {
            return false
        }

        var freqArray = Array(repeating: 0, count: 26)

        for char in s {
            if let ascii = char.asciiValue {
                let index = Int(ascii - 97)
                freqArray[index] += 1
            }
        }

        for char in t {
            if let ascii = char.asciiValue {
                let index = Int(ascii - 97)
                freqArray[index] -= 1
            }
        }

        for count in freqArray {
            if count != 0 {
                return false
            }
        }

        return true
    }
}
