class Solution {
    // Brute force
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var sortedSet: [Int] = nums1 + nums2
        sortedSet.sort()
        
        let count = sortedSet.count
        let mid = count / 2

        if count % 2 == 0 {
            return (Double(sortedSet[mid]) + Double(sortedSet[mid - 1])) / 2.0
        } else {
            return Double(sortedSet[mid])
        }
    }
}

class Solution {
    // Most Optimal 
    // Run binary search on less size array :)
    // TC: O(min(log(m), log(n)))
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1
        var nums2 = nums2

        let n1 = nums1.count
        let n2 = nums2.count

        // Always binary search on the smaller array
        if n1 > n2 {
            return findMedianSortedArrays(nums2, nums1)
        }

        var low = 0
        var high = n1
        let total = n1 + n2
        let half = (total + 1) / 2

        while low <= high {
            let mid1 = (low + high) / 2
            let mid2 = half - mid1

            let l1 = (mid1 > 0) ? nums1[mid1 - 1] : Int.min
            let l2 = (mid2 > 0) ? nums2[mid2 - 1] : Int.min
            let r1 = (mid1 < n1) ? nums1[mid1] : Int.max
            let r2 = (mid2 < n2) ? nums2[mid2] : Int.max

            if l1 <= r2 && l2 <= r1 {
                if total % 2 == 1 {
                    return Double(max(l1, l2))
                } else {
                    return (Double(max(l1, l2)) + Double(min(r1, r2))) / 2.0
                }
            } else if l1 > r2 {
                high = mid1 - 1
            } else {
                low = mid1 + 1
            }
        }

        return 0.0
    }
}
