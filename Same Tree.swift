class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        // if any one becomes nil
        if p == nil || q == nil {
            return p == q
        }

        // check value + left + right
        return p!.val == q!.val &&
               isSameTree(p!.left, q!.left) &&
               isSameTree(p!.right, q!.right)
    }
}
