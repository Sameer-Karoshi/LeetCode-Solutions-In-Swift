class MyCircularQueue {
    private var circularQueue: [Int]
    private var front: Int
    private var rear: Int
    private var size: Int
    private let k: Int

    init(_ k: Int) {
        self.circularQueue = Array(repeating: 0, count: k)
        self.front = 0
        self.rear = 0
        self.size = 0
        self.k = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }

        circularQueue[rear] = value
        rear = rear == k - 1 ? 0 : rear + 1
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        front = front == k - 1 ? 0 : front + 1
        size -= 1
        return true
    }
    
    func Front() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return circularQueue[front]
    }
    
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return circularQueue[rear == 0 ? k - 1 : rear - 1]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == k
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */