class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var j = 0
        for i in m..<m + n {
            nums1[i] = nums2[j]
            j += 1
        }
        
        nums1.sort()
    }
}
