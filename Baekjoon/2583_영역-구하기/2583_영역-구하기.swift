import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = firstLine[0]
    let n = firstLine[1]
    let k = firstLine[2]

    var paper: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

    var rectPoints: [[Int]] = []
    for _ in 0..<k {
        rectPoints.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }

    for i in 0..<rectPoints.count {
        let leftPoint = (rectPoints[i][0],rectPoints[i][1])
        let rightPoint = (rectPoints[i][2],rectPoints[i][3])
        
        for j in leftPoint.0..<rightPoint.0 {
            for k in leftPoint.1..<rightPoint.1{
                paper[k][j] = 1
            }
        }
    }
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    var result: [Int] = []
    var count: Int = 0

    func dfs(_ x: Int, _ y: Int) {
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx >= 0 && ny >= 0 && nx <= n-1 && ny <= m-1 && paper[ny][nx] == 0 {
                paper[ny][nx] = 1
                count += 1
                dfs(nx,ny)
            }
            
        }
    }

    for i in 0..<m {
        for j in 0..<n {
            if paper[i][j] == 0 {
                paper[i][j] = 1
                count += 1
                dfs(j,i)
                result.append(count)
                count = 0
            }
        }
    }
    
    result.sort()
    print(result.count)
    var resultString: String = ""
    for i in result {
        resultString += "\(i) "
    }
    print(resultString)
}
solution()
