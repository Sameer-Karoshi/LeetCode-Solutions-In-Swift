class Solution {
    func uniformArray(_ nums1: [Int]) -> Bool {
        let odd = nums1.filter { $0 % 2 != 0 }
        let even = nums1.filter { $0 % 2 == 0 }

        let allOdd = nums1.count == odd.count
        let allEven = nums1.count == even.count

        let smallestOdd = odd.min() ?? Int.max
        let smallestEven = even.min() ?? Int.max

        return allEven || allOdd || smallestOdd < smallestEven
    }
}
