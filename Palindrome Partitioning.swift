class Solution {
    // Main function to initiate partitioning
    func partition(_ s: String) -> [[String]] {
        var tempArray: [String] = []  // Current list of palindromic substrings
        var result: [[String]] = []   // Final result list of all partitions
        doPartition(index: 0, str: s, tempArray: &tempArray, result: &result)
        return result
    }

    // Recursive backtracking function
    private func doPartition(index: Int, str: String, tempArray: inout [String], result: inout [[String]]) {
        // If we’ve reached the end of the string, add the current partition to the result
        if index == str.count {
            result.append(tempArray)
            return
        }

        // Iterate through the string from current index to end
        for i in index..<str.count {
            if isPalindrome(str: str, start: index, end: i) {
                // Extract substring using String.Index
                let startIdx = str.index(str.startIndex, offsetBy: index)
                let endIdx = str.index(str.startIndex, offsetBy: i)
                let substring = String(str[startIdx...endIdx])

                tempArray.append(substring) // Choose
                doPartition(index: i + 1, str: str, tempArray: &tempArray, result: &result) // Explore
                tempArray.removeLast() // Backtrack
            }
        }
    }

    // Utility function to check if a substring is a palindrome
    private func isPalindrome(str: String, start: Int, end: Int) -> Bool {
        let characters = Array(str)
        var left = start
        var right = end
        
        while left < right {
            if characters[left] != characters[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
