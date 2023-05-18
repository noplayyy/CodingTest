let testCase = Int(readLine()!)!

func dfs(_ x: Int, _ y: Int, _ land: inout [[Int]], _ h: Int, _ v: Int) {
    if x < 0 || x >= v || y < 0 || y >= h || land[x][y] != 1 { return }
    
    land[x][y] = 0

    dfs(x+1, y, &land, h, v)
    dfs(x-1, y, &land, h, v)
    dfs(x, y+1, &land, h, v)
    dfs(x, y-1, &land, h, v)
}

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    let h = input[0]
    let v = input[1]
    let num = input[2]
    var land = Array(repeating: Array(repeating: 0, count:  h), count: v)
    var count = 0

    for _ in 0..<num {
        let location = readLine()!.split(separator: " ").map({Int(String($0))!})
        land[location[1]][location[0]] = 1
    }

    for i in 0..<v {
        for j in 0..<h {
            if land[i][j] == 1 {
                count += 1
                dfs(i, j, &land, h, v)
            }
        }
    }
    
    print(count)
}
