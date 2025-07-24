class Solution {
    // Brute force
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = Int.min
        for i in 0..<nums.count {
            var currProduct = 1
            for j in i..<nums.count {
                currProduct = currProduct * nums[j]
                maxProduct = max(maxProduct, currProduct)
            }
        }

        return maxProduct
    }
}

class Solution {
    // Optimized
    func maxProduct(_ nums: [Int]) -> Int {
        var maxProduct = Int.min
        var prefixProduct = 1
        var suffixProduct = 1
        var n = nums.count
        for i in 0..<n {
            if prefixProduct == 0 {
                prefixProduct = 1
            }

            if suffixProduct == 0 {
                suffixProduct = 1
            }

            prefixProduct = prefixProduct * nums[i]
            suffixProduct = suffixProduct * nums[n - i - 1]

            maxProduct = max(maxProduct, max(prefixProduct, suffixProduct))
        }

        return maxProduct
    }
}
