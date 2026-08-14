class Solution {
    func floodFill(
        _ image: [[Int]],
        _ sr: Int,
        _ sc: Int,
        _ color: Int
    ) -> [[Int]] {

        var result = image
        let initialColor = image[sr][sc]

        if initialColor == color {
            return result
        }

        dfs(sr, sc, initialColor, color, &result)

        return result
    }

    private func dfs(
        _ row: Int,
        _ col: Int,
        _ initialColor: Int,
        _ newColor: Int,
        _ image: inout [[Int]]
    ) {

        image[row][col] = newColor

        let directions = [
            (-1, 0), // Up
            (0, 1),  // Right
            (1, 0),  // Down
            (0, -1)  // Left
        ]

        for (dr, dc) in directions {

            let newRow = row + dr
            let newCol = col + dc

            if newRow >= 0 &&
                newRow < image.count &&
                newCol >= 0 &&
                newCol < image[0].count &&
                image[newRow][newCol] == initialColor {

                dfs(newRow, newCol, initialColor, newColor, &image)
            }
        }
    }
}

/*
Time Complexity: O(N * M)
- Every pixel is visited at most once.

Space Complexity: O(N * M)
- Recursion stack in worst case.
*/
