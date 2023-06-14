class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        // create a stack
        var stack = Stack()
        stack.push(0)

        // create a set
        var set: Set<Int> = [0]

        while (!stack.isEmpty()) {
            guard let i = stack.pop() else {
                return false
            }

            for j in rooms[i] {
                if (!set.contains(j)) {
                    stack.push(j)
                    set.insert(j)
                }
            }
        }
        return rooms.count == set.count
    }
}

struct Stack {
    private var array: [Int] = []
    mutating func push(_ item: Int) {
        array.append(item)
    }
    mutating func pop() -> Int? {
        return array.popLast()
    }
    func peek() -> Int? {
        return array.last
    }
    func isEmpty() -> Bool {
        return array.count == 0
    }
}