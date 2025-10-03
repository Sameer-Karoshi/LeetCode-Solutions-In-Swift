import Foundation

class Solution {
    /// Returns the k-th permutation sequence of numbers from 1 to n using `while true`
    func getPermutation(_ n: Int, _ k: Int) -> String {
        // Step 1: Create list of numbers to pick from
        var numbers = Array(1...n)

        // Step 2: Compute factorial of (n - 1)
        var fact = 1
        for i in 1..<n {
            fact *= i
        }

        // Step 3: Convert k to 0-based index
        var k = k - 1

        // Step 4: Initialize result string
        var result = ""

        // Step 5: Start infinite loop to build result
        var currentN = n
        while true {
            // Calculate the index of the number to use
            let index = k / fact
            result.append(String(numbers[index]))
            numbers.remove(at: index)

            currentN -= 1

            // If all digits are used, break the loop
            if currentN == 0 {
                break
            }

            // Update k and fact for next position
            k %= fact
            fact /= currentN
        }

        return result
    }
}
