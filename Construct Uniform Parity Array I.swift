class Solution {
    func uniformArray(_ nums1: [Int]) -> Bool {
        // We can always keep each element as it is.
        // If all elements already have the same parity,
        // nums2 is already a uniform parity array.
        
        // If the array contains both odd and even numbers,
        // we can subtract an element with the opposite parity:
        // odd - even = odd
        // even - odd = odd
        //
        // Thus, we can make all elements odd.
        
        // Since nums1 contains distinct integers, the required
        // choices are possible whenever a subtraction is needed.
        return true
    }
}
