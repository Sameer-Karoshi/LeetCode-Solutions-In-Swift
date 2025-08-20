class Solution {
    // Better using heap (TC: O(nlog(k)))
    // Brute force (sorting) (TC: O(nlog(n)))
    // This can be solved using bucket sort (TC: O(n))
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyMap: [Int: Int] = [:]
        for num in nums {
            frequencyMap[num, default: 0] += 1
        }

        var minHeap = MinHeap()
        
        for (num, freq) in frequencyMap {
            if minHeap.heap.count < k {
                minHeap.insert((freq, num))
            } else if let minFreq = minHeap.peek()?.0, freq > minFreq {
                minHeap.removeMin()
                minHeap.insert((freq, num))
            }
        }

        var result: [Int] = []
        while !minHeap.isEmpty() {
            if let (_, num) = minHeap.removeMin() {
                result.append(num)
            }
        }

        return result
    }
}

struct MinHeap {
    var heap: [(Int, Int)] = []

    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var index = heap.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if heap[index].0 >= heap[parent].0 {
                break
            }
            heap.swapAt(index, parent)
            index = parent
        }
    }

    mutating func removeMin() -> (Int, Int)? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        }

        let min = heap[0]
        heap[0] = heap.removeLast()

        var index = 0
        while true {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var smallest = index

            if left < heap.count && heap[left].0 < heap[smallest].0 {
                smallest = left
            }
            if right < heap.count && heap[right].0 < heap[smallest].0 {
                smallest = right
            }
            if smallest == index {
                break
            }
            heap.swapAt(index, smallest)
            index = smallest
        }

        return min
    }

    func peek() -> (Int, Int)? {
        return heap.first
    }

    func isEmpty() -> Bool {
        return heap.isEmpty
    }
}
