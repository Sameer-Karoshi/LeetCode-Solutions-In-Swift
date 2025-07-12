class Solution {
    brute force
    func majorityElement(_ nums: [Int]) -> [Int] {
        var freqDict: [Int:Int] = [:]
        for num in nums {
            if let value = freqDict[num] {
                var localVal = value + 1
                freqDict[num] = localVal
            } else {
                freqDict[num] = 1
            }
        }

        var resultArray: [Int] = []
        for (key, value) in freqDict {
            if value > (nums.count / 3) {
                resultArray.append(key)
            }
        }

        return resultArray
    }

    // optimal using Moore's also (Slight modified)
    func majorityElement(_ nums: [Int]) -> [Int] {
        var count1 = 0
        var count2 = 0;
        var element1 = Int.min
        var element2 = Int.min

        for num in nums {
            if count1 == 0 && num != element2 {
                count1 = 1
                element1 = num
            } else if count2 == 0 && num != element1 {
                count2 = 1
                element2 = num
            } else if num == element1 {
                count1 = count1 + 1
            } else if num == element2 {
                count2 = count2 + 1
            } else {
                count1 = count1 - 1 
                count2 = count2 - 1 
            }
        }

        count1 = 0
        count2 = 0
        for num in nums {
            if num == element1 {
                count1 = count1 + 1
            } else if num == element2 {
                count2 = count2 + 1
            }
        }

        var result: [Int] = []
        if count1 > (nums.count / 3) {
            result.append(element1)
        }
        if count2 > (nums.count / 3) {
            result.append(element2)
        }

        return result
    }
}
