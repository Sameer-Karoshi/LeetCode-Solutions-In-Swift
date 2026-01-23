class Solution {
    func clumsy(_ n: Int) -> Int {
        // Operation cycle: *, /, +, -
        let ops = ["*", "/", "+", "-"]
        
        // Start recursion with:
        // n = current number
        // operation index = 0 (start with *)
        // result = accumulated sum
        // current = current term being built
        return clumsyFactorial(n: n, listOfOperations: ops, currentOperationIndex: 0, result: 0, current: n)
    }

    func clumsyFactorial(n: Int, listOfOperations: [String], currentOperationIndex: Int, result: Int, current: Int) -> Int {
        // Base case: when only one number is left,
        // add the current term to result and return
        if n == 1 {
            return result + current
        }

        let op = listOfOperations[currentOperationIndex] // Current operator
        let next = n - 1                                 // Next number in sequence
        var newResult = result                           // Accumulated result
        var newCurrent = current                         // Current term being processed

        if op == "*" {
            // Multiply continues the current term
            newCurrent = current * next
        } else if op == "/" {
            // Divide continues the current term (integer division)
            newCurrent = current / next
        } else if op == "+" {
            // + means current term is finished, add it to result
            newResult = result + current
            newCurrent = next
        } else { // "-"
            // - means current term is finished, add it to result
            // Next term becomes negative
            newResult = result + current
            newCurrent = -next
        }

        // Move to next number and next operator (cyclic)
        return clumsyFactorial(
            n: next,
            listOfOperations: listOfOperations,
            currentOperationIndex: (currentOperationIndex + 1) % 4,
            result: newResult,
            current: newCurrent
        )
    }
}
