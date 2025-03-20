class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        // Most optimal solution
        var result: [[Int]] = []
        nums.sort()
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }

            var j = i + 1
            var k = nums.count - 1

            while j < k {
                var sum = nums[i] + nums[j] + nums[k]
                if sum < 0 {
                    j += 1
                } else if sum > 0 {
                    k -= 1
                } else {
                    var subArray = [nums[i], nums[j], nums[k]]
                    result.append(subArray)

                    j += 1
                    k -= 1

                    while(j < k && nums[j] == nums[j-1]) {
                        j += 1
                    }

                    while(j < k && nums[k] == nums[k+1]) {
                        k -= 1
                    }
                }
            }
        }

        return result
    }
}
