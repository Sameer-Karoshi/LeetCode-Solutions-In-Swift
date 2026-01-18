class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var temp: [Int] = []
        
        for num in nums {
            if let last = temp.last, num > last {
                temp.append(num)
            } else {
                let index = lowerBound(temp, num)
                if index < temp.count {
                    temp[index] = num
                }
            }
        }
        
        return temp.count
    }
    
    // Binary search to find first index where arr[index] >= target
    private func lowerBound(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        var ans = arr.count
        
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] >= target {
                ans = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return ans
    }
}
