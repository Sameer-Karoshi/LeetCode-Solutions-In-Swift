class Solution {
    // Better
    func singleNumber(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]

        for num in nums {
            if map.keys.contains(num) {
                var value = map[num] ?? 0
                value = value + 1
                map[num] = value
            } else {
                map[num] = 1
            }
        } 

        for (key, val) in map {
            if val == 1 {
                return key
            }
        }

        return -1
    }
}

class Solution {
    // Optimized
    func singleNumber(_ nums: [Int]) -> Int {
        var Xor = 0
        for num in nums {
            Xor = Xor ^ num
        } 

        return Xor
    }
}
