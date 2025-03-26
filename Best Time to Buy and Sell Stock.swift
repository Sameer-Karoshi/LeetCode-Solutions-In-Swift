class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // DP - I am remembering the past (min price of stock)
        var maxProfit = 0
        var minValueOfStock = prices[0]
        for i in 1..<prices.count {
           if prices[i] < minValueOfStock {
            minValueOfStock = prices[i]
           } else {
            maxProfit = max(maxProfit, prices[i] - minValueOfStock)
           }
        }

        return maxProfit
    }
}
