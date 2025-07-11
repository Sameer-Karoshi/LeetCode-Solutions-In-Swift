class Solution {
    // Better solution
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()

        for num in nums {
            if let value = dict[num] {
                var val = value + 1
                dict[num] = val
            } else {
                dict[num] = 1
            }
        }

        // print(dict)
        for (key, value) in dict {
            if value > (nums.count / 2) {
                return key
            } 
        }

        return -1
    }

    // Optimized solution (Moore's voting algorithm)
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var item = 0

        for num in nums {
            if count == 0 {
                count = 1
                item = num
            } else if(num == item) {
                count = count + 1
            } else {
                count = count - 1
            }
        }

        return item
    }
}
