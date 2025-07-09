class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sortedIntervals = intervals 
        // sort the 2D array
        sortedIntervals.sort {
            if $0[0] == $1[0] {
                // If first elements equal, compare second
                return $0[1] < $1[1]
            } else {
                // Otherwise, compare first elements
                return $0[0] < $1[0]
            }
        }

        var resultIntervals: [[Int]] = [] 
        for i in 0..<sortedIntervals.count {
            if resultIntervals.isEmpty || sortedIntervals[i][0] > resultIntervals[resultIntervals.count - 1][1] {
                resultIntervals.append(sortedIntervals[i])
            } else {
                resultIntervals[resultIntervals.count - 1][1] = max(resultIntervals[resultIntervals.count - 1][1], sortedIntervals[i][1])
            }
        }

        return resultIntervals
    }
}
