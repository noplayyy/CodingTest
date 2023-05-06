import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let u = input[0]
    let v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(_ node: Int) -> Int {
    visited[node] = true
    var count = 1
    for i in 0..<graph[node].count {
        let next = graph[node][i]
        if !visited[next] {
            count += dfs(next)
        }
    }
    return count
}

print(dfs(1)-1)
