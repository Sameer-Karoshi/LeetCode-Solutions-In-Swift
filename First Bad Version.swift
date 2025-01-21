/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
      // We can solve this using binary search algo (Better Approach).
        if n == 1 {
            return n
        }

        var head = n/2
        var trail = n/2
        
        while (head >= 0 && trail <= n) {
            if isBadVersion(head) && !isBadVersion(head-1) {
                return head
            } else if !isBadVersion(trail) && isBadVersion(trail+1) {
                return trail + 1
            }
            head -= 1
            trail += 1
        }

        return -1
    }
}
