import Foundation

class Solution {
    
    // Function to check if it's safe to assign color to a node
    func isSafe(_ node: Int, _ graph: [[Int]], _ colors: inout [Int], _ color: Int) -> Bool {
        // Iterate through the neighbors of the current node
        for neighbor in graph[node] {
            // If a neighbor has the same color, it's not safe
            if colors[neighbor] == color {
                return false
            }
        }
        return true
    }
    
    // Backtracking function to try coloring each node
    func solve(_ node: Int, _ graph: [[Int]], _ m: Int, _ colors: inout [Int]) -> Bool {
        // If all nodes are colored, return true
        if node == graph.count {
            return true
        }
        
        // Try coloring the current node with each color
        for c in 1...m {
            // Check if it's safe to color the current node with the color 'c'
            if isSafe(node, graph, &colors, c) {
                // Assign the color to the current node
                colors[node] = c
                
                // Recursively try to color the next node
                if solve(node + 1, graph, m, &colors) {
                    return true
                }
                
                // Backtrack if no valid coloring was found
                colors[node] = 0
            }
        }
        
        return false
    }
    
    // Main function to check if the graph can be colored with m colors
    func graphColoring(_ graph: [[Int]], _ m: Int) -> Bool {
        var colors = Array(repeating: 0, count: graph.count)
        return solve(0, graph, m, &colors)
    }
}
