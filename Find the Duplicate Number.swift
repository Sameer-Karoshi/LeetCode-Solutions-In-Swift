class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        // Floyd's Tortoise and Hare (Cycle Detection) algorithm
        var slow = nums[0]
        var fast = nums[0]

        // find the intersection point by moving slow by 1 and fast by 2
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast

       // Find the entrance to the cycle
       fast = nums[0]
       while fast != slow {
        fast = nums[fast]
        slow = nums[slow]
       }

       return fast
    }
}
