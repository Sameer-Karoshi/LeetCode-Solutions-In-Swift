// solve this using recursion (We can solve this using simple for loop also)
class Solution {
    func fib(_ n: Int) -> Int {
        // f(0) = 0, f(1) = 1, f(2) = 1
        if n <= 1 {
            return n
        }

        return fib(n-1) + fib(n-2)
    }
}
