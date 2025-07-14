class Solution {
    // Brute force
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        var localNums = nums.sorted{$0 > $1}

        var freq = 0
        for i in 0..<localNums.count {
            var tempK = k
            var localFreq = 1
            for j in (i+1)..<localNums.count {
                if (tempK - (localNums[i] - localNums[j])) >= 0 {
                    tempK = tempK - (localNums[i] - localNums[j])
                    localFreq = localFreq + 1
                } else {
                    break
                }
            }

            freq = max(localFreq, freq)
        }

        return freq
    }

    // Optimized (Expanding sliding window)
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
         var localNums = nums.sorted()

         var left = 0
         var right = 0

         var freq = 0
         var totalSum = 0

         while right < localNums.count {
            totalSum = totalSum + localNums[right]

            while (localNums[right]*(right - left + 1)) > (totalSum + k) {
                totalSum = totalSum - localNums[left]
                left = left + 1
            }

            freq = max(freq, right - left + 1)
            right = right + 1
         }

         return freq
    }
}
