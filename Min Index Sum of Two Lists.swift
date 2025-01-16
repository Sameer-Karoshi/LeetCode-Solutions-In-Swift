class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var minimumIndexSumRestaurant: [String: Int] = [:]
        for (index, item) in list1.enumerated() {
            if list2.contains(item) {
                if let firstIndex = list2.firstIndex(of: item) {
                    minimumIndexSumRestaurant[item] = index + firstIndex
                }
            }
        } 

        guard let minEntry =  minimumIndexSumRestaurant.min(by: { $0.value < $1.value }) else {
            return [""]
        }

        var result:[String] = []
        for (key, value) in minimumIndexSumRestaurant {
            if let minEntry =  minimumIndexSumRestaurant.min(by: { $0.value < $1.value }),
            minEntry.value == value {
                result.append(key)
            }
        }

        return result
    }
}
