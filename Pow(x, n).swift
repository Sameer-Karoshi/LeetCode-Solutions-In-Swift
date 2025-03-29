class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        // Base case: anything raised to the power of 0 is 1
        if n == 0 {
            return 1.0
        }
    
        var exponent = abs(n)
        var result = 1.0
        var base = x
        
        while exponent > 0 {
            // If exponent is odd, multiply result by the base
            if exponent % 2 == 1 {
                result *= base
            }
            
            // Square the base for the next iteration
            base *= base
            
            // Halve the exponent
            exponent /= 2
        }
        
        // If exponent was negative, return the reciprocal of the result
        return n < 0 ? 1 / result : result
    }
}
