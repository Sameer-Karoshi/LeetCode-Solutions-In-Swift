// Approach - 1 (By using Map)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var resultArray: [[Int]] = []       // Stores all the permutations
        var tempArray: [Int] = []           // Temporary array to build a permutation
        var freqArray: [Bool] = Array(repeating: false, count: nums.count) 
        // Keeps track of which elements have been used

        // Start the recursive permutation generation
        allPermutations(nums: nums, freqArray: &freqArray, tempArray: &tempArray, resultArray: &resultArray)

        return resultArray
    }

    private func allPermutations(nums: [Int], freqArray: inout [Bool], tempArray: inout [Int], resultArray: inout [[Int]]) {
        // Base case: if tempArray has the same number of elements as nums,
        // it means we have a complete permutation
        if tempArray.count == nums.count {
            resultArray.append(tempArray)
            return
        }

        // Try placing each unused number at the current position
        for i in 0..<nums.count {
            if !freqArray[i] {
                // Choose
                tempArray.append(nums[i])
                freqArray[i] = true

                // Explore
                allPermutations(nums: nums, freqArray: &freqArray, tempArray: &tempArray, resultArray: &resultArray)

                // Un-choose (backtrack)
                freqArray[i] = false
                tempArray.removeLast()
            }
        }
    }
}

// Approach - 2 (Without using extra space - Swapping)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var resultArray: [[Int]] = []     // Final array to store all permutations
        var nums = nums                   // Make a mutable copy of input array

        // Start generating permutations from index 0
        allPermutations(index: 0, nums: &nums, resultArray: &resultArray)

        return resultArray
    }

    private func allPermutations(index: Int, nums: inout [Int], resultArray: inout [[Int]]) {
        // Base case: if current index reaches the end, we have a valid permutation
        if index == nums.count {
            resultArray.append(nums)      // Append the current permutation to result
            return                        // Important: don't forget to return!
        }

        // Try placing each element at the current index
        for i in index..<nums.count {
            nums.swapAt(i, index)         // Swap element at i with the one at current index
            allPermutations(index: index + 1, nums: &nums, resultArray: &resultArray)
            nums.swapAt(i, index)         // Backtrack: restore the original array
        }
    }
}
