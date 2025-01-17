class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        var numberOfOnes = 0
        for item in derived {
            if item == 1 {
                numberOfOnes += 1
            }
        }

        // number of ones should be even if its odd then we cannot able to get the orignal array :)
        return numberOfOnes % 2 == 0
    }
}
