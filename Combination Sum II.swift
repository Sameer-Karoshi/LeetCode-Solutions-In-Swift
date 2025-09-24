class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates
        candidates.sort()
        var answer: [[Int]] = [] 
        var tempArr: [Int] = [] 
        findCombination(index: 0, target: target, candidates: &candidates, answer: &answer, tempArr: &tempArr)
        return answer
    }
    private func findCombination(index: Int, target: Int, candidates: inout [Int], answer: inout [[Int]], tempArr: inout [Int]) {
        if target == 0 {
            answer.append(tempArr)
            return
        }

        for i in index..<candidates.count {
            if i > index && candidates[i] == candidates[i-1] {
                // dont pick the item
                continue
            }

            if candidates[i] > target {
                break
            }

            tempArr.append(candidates[i])
            findCombination(index: i + 1, target: target - candidates[i], candidates: &candidates, answer: &answer, tempArr: &tempArr)
            tempArr.removeLast()
        }
    }
}
