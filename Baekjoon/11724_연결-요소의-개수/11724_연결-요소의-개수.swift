import Foundation

func dfs(_ graph: [[Int]], _ visited: inout [Bool], _ vertex: Int) {
    visited[vertex] = true
    
    for nextVertex in graph[vertex] {
        if !visited[nextVertex] {
            dfs(graph, &visited, nextVertex)
        }
    }
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]

var graph = [[Int]](repeating: [], count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{Int($0)!}
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

var visited = [Bool](repeating: false, count: n+1)
var count = 0

for vertex in 1...n {
    if !visited[vertex] {
        count += 1
        dfs(graph, &visited, vertex)
    }
}

print(count)
