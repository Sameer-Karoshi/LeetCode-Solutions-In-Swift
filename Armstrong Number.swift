class Solution {
    func isArmstrongNumber(_ number: Int) -> Bool {
      var temp = number
      var sum = 0
      var n = number
      var digitsCount = 0
  
      // First, count digits using a backup of `number`
      while n > 0 {
          digitsCount += 1
          n /= 10
      }
  
      // Now compute sum of each digit^digitsCount in same loop
      while temp > 0 {
          let digit = temp % 10
          var power = 1
          for _ in 0..<digitsCount {
              power *= digit
          }
          sum += power
          temp /= 10
      }
  
      return sum == number
  }
}
