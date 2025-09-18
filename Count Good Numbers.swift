class Solution {
    
    // Function to count the number of good numbers of length n
    func countGoodNumbers(_ n: Int) -> Int {
        // Modulo constant to prevent integer overflow
        let MOD = 1_000_000_007
        
        // Good numbers follow this rule:
        // - Even positions (0-based index) can have 5 choices: 0, 2, 4, 6, 8
        // - Odd positions can have 4 choices: 2, 3, 5, 7 (prime digits)
        // So:
        // - Number of even positions = (n + 1) / 2
        // - Number of odd positions = n / 2
        //
        // Total combinations = 5^(even positions) * 4^(odd positions)
        
        let evenPositions = (n + 1) / 2
        let oddPositions = n / 2
        
        // Compute 5^evenPositions % MOD and 4^oddPositions % MOD
        let powerOf5 = modPow(5, evenPositions, MOD)
        let powerOf4 = modPow(4, oddPositions, MOD)
        
        // Return the product modulo MOD
        return (powerOf5 * powerOf4) % MOD
    }

    // Modular exponentiation function to compute (base^exponent) % mod efficiently
    func modPow(_ base: Int, _ exponent: Int, _ mod: Int) -> Int {
        var result = 1
        var base = base % mod
        var exponent = exponent

        while exponent > 0 {
            // If exponent is odd, multiply result with current base
            if exponent % 2 == 1 {
                result = (result * base) % mod
            }
            // Square the base and reduce the exponent by half
            base = (base * base) % mod
            exponent /= 2
        }

        return result
    }
}
