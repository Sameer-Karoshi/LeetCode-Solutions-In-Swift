class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        // We create a dictionary to map characters from s to t
        var map = [Character: Character]()
        
        // Since both strings have the same length, iterate through either
        for i in s.indices {
            let charS = s[i]
            let charT = t[i]
            
            // Check if map contains the key (character in s)
            if let mappedChar = map[charS] {
                // If it is mapped to a different character, return false
                if mappedChar != charT {
                    return false
                }
            } else {
                // If the value already exists in the map (meaning charT is already assigned),
                // return false to avoid duplicate mapping
                if map.values.contains(charT) {
                    return false
                }
                // Otherwise, add the mapping
                map[charS] = charT
            }
        }
        
        // If all checks passed, return true
        return true
    }
}
