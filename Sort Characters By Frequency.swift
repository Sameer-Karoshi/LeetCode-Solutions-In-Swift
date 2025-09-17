class Solution {
    func frequencySort(_ s: String) -> String {
        var freqMap: [Character: Int] = [:] 

        for char in s {
            if let value = freqMap[char] {
                var newValue = value + 1
                 freqMap[char] = newValue
            } else {
                freqMap[char] = 1
            }
        }

        // Sort by value (descending)
        let sortedByValue = freqMap.sorted { $0.value > $1.value }

        var result = ""
        for (key, value) in sortedByValue {
            result += String(repeating: key, count: value)
        }

        return result
    }
}

// Using bucket sort - O(n)
class Solution {
    func frequencySort(_ s: String) -> String {
        var freqMap: [Character: Int] = [:]

        // Step 1: Count frequencies
        for char in s {
            freqMap[char, default: 0] += 1
        }

        // Step 2: Create buckets. Max frequency can be at most s.count
        var buckets = Array(repeating: [Character](), count: s.count + 1)

        // Step 3: Place characters in buckets based on frequency
        for (char, freq) in freqMap {
            buckets[freq].append(char)
        }

        // Step 4: Build result from buckets, starting from highest frequency
        var result = ""
        for freq in stride(from: buckets.count - 1, through: 1, by: -1) {
            for char in buckets[freq] {
                result += String(repeating: char, count: freq)
            }
        }

        return result
    }
}
