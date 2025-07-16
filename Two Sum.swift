class Solution {
    // Brute force
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            if let secondPart = nums[(i+1)...].firstIndex(of: target - nums[i]) {
                return [i, secondPart]
            }
        }

        return [-1, -1]
    }

    // Optimal
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int : Int] = [:]
        for i in 0..<nums.count {
            if map.values.contains(target - nums[i]),
             let firstKey = map.first(where: { $0.value == (target - nums[i]) })?.key {
                return [i, firstKey]
            } else {
                map[i] = nums[i] 
            }
        }

        return [-1, -1]
    }
}
