class Solution {

    func canFinish(
        _ numCourses: Int,
        _ prerequisites: [[Int]]
    ) -> Bool {

        var adj = Array(
            repeating: [Int](),
            count: numCourses
        )

        var indegree = Array(
            repeating: 0,
            count: numCourses
        )

        for prerequisite in prerequisites {

            let course = prerequisite[0]
            let preReq = prerequisite[1]

            adj[preReq].append(course)
            indegree[course] += 1
        }

        var queue: [Int] = []

        for course in 0..<numCourses {
            if indegree[course] == 0 {
                queue.append(course)
            }
        }

        var count = 0

        while !queue.isEmpty {

            let course = queue.removeFirst()
            count += 1

            for neighbor in adj[course] {

                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return count == numCourses
    }

    func findOrder(
        _ numCourses: Int,
        _ prerequisites: [[Int]]
    ) -> [Int] {

        var adj = Array(
            repeating: [Int](),
            count: numCourses
        )

        var indegree = Array(
            repeating: 0,
            count: numCourses
        )

        for prerequisite in prerequisites {

            let course = prerequisite[0]
            let preReq = prerequisite[1]

            adj[preReq].append(course)
            indegree[course] += 1
        }

        var queue: [Int] = []

        for course in 0..<numCourses {
            if indegree[course] == 0 {
                queue.append(course)
            }
        }

        var result: [Int] = []

        while !queue.isEmpty {

            let course = queue.removeFirst()
            result.append(course)

            for neighbor in adj[course] {

                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return result.count == numCourses
            ? result
            : []
    }
}

/*
Course Schedule I (LeetCode 207)

Return:
true  -> All courses can be completed
false -> Cycle exists

------------------------------------------------

Course Schedule II (LeetCode 210)

Return:
Valid topological ordering

If cycle exists:
[]

------------------------------------------------

Kahn's Algorithm (BFS + Indegree)

1. Calculate indegree of every node.
2. Add all nodes with indegree 0 into queue.
3. Perform BFS.
4. Reduce indegree of neighbors.
5. If indegree becomes 0, add to queue.

Cycle Detection:

topoSort.count == V -> No Cycle
topoSort.count < V  -> Cycle Exists

Time Complexity: O(V + E)
Space Complexity: O(V + E)
*/
