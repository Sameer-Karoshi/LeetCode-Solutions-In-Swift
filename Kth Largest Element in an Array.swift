// Using Priority Queue
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var priorityQueue = MinHeap<Int>()

        for i in 0..<k {
            priorityQueue.insert(nums[i])
        }

        for i in k..<nums.count {
            if nums[i] > priorityQueue.peek() ?? -10000 {
                priorityQueue.removeMin()
                priorityQueue.insert(nums[i])
            }
        }

        return priorityQueue.peek() ?? -10000
    }
}

struct MinHeap {
    private var heap: [Int] = []

    mutating func insert(_ value: Int) {
        heap.append(value)
        var index = heap.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if heap[index] >= heap[parent] {
                break
            }
            heap.swapAt(index, parent)
            index = parent
        }
    }

    mutating func removeMin() -> Int? {
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

            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count && heap[right] < heap[smallest] {
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

    func peek() -> Int? {
        return heap.first
    }

    func isEmpty() -> Bool {
        return heap.isEmpty
    }
}

// Using Quick Select Algo

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let target = nums.count - k

        func quickSelect(_ left: Int, _ right: Int) -> Int {
            let pivotIndex = partition(&nums, left, right)
            if pivotIndex == target {
                return nums[pivotIndex]
            } else if pivotIndex < target {
                return quickSelect(pivotIndex + 1, right)
            } else {
                return quickSelect(left, pivotIndex - 1)
            }
        }

        func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
            let pivot = nums[right]
            var i = left
            for j in left..<right {
                if nums[j] <= pivot {
                    nums.swapAt(i, j)
                    i += 1
                }
            }
            nums.swapAt(i, right)
            return i
        }

        return quickSelect(0, nums.count - 1)
    }
}

