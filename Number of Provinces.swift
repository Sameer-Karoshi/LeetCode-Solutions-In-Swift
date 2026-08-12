class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count

        var adjList = Array(repeating: [Int](), count: n)

        for i in 0..<n {
            for j in 0..<n {
                if i != j && isConnected[i][j] == 1 {
                    adjList[i].append(j)
                }
            }
        }

        var visited = Array(repeating: false, count: n)
        var provinces = 0

        for city in 0..<n {
            if !visited[city] {
                provinces += 1
                dfs(city, adjList, &visited)
            }
        }

        return provinces
    }

    private func dfs(_ node: Int,
                     _ adjList: [[Int]],
                     _ visited: inout [Bool]) {

        visited[node] = true

        for neighbor in adjList[node] {
            if !visited[neighbor] {
                dfs(neighbor, adjList, &visited)
            }
        }
    }
}
