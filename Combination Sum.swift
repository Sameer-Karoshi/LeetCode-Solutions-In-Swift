class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates
        var answer: [[Int]] = [] 
        var tempArr: [Int] = [] 

        findCombination(index: 0, target: target, candidates: &candidates, answer: &answer, tempArr: &tempArr)
        return answer
    }

    private func findCombination(index: Int, target: Int, candidates: inout [Int], answer: inout [[Int]], tempArr: inout [Int]) {
        // If we've considered all candidates
        if index == candidates.count {
            if target == 0 {
                // Found a valid combination, add a copy of tempArr to answer
                answer.append(tempArr)
            }
            return
        }

        // Pick the current candidate if it doesn't exceed the target
        if candidates[index] <= target {
            tempArr.append(candidates[index])  // Choose the candidate
            findCombination(index: index, target: target - candidates[index], candidates: &candidates, answer: &answer, tempArr: &tempArr)
            tempArr.removeLast()  // Backtrack: remove the last added candidate
        }

        // Skip the current candidate and move to the next
        findCombination(index: index + 1, target: target, candidates: &candidates, answer: &answer, tempArr: &tempArr)
    }
}
