import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var picture: [[String]] = []
    
    for _ in 0..<n {
        picture.append(readLine()!.map({String($0)}))
    }
    var normal: Int = 0
    var colorWeakness: Int = 0
    
    var normalVisit: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var colorWeaknessVisit: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var stack: [[Int]] = []
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]

    for i in 0..<n {
        for j in 0..<n {
            if normalVisit[i][j] == 0 {
                normalVisit[i][j] = 1
                normal += 1
                stack.append([i,j])
                while(!stack.isEmpty) {
                    let now = stack.popLast()!
                    let nowColor = picture[now[0]][now[1]]
                    for k in 0..<dx.count {
                        let newX = now[1] + dx[k]
                        let newY = now[0] + dy[k]

                        if newX < 0 || newX > n-1 || newY < 0 || newY > n-1 {
                            continue
                        } else {
                            if normalVisit[newY][newX] == 1 {
                                continue
                            } else {
                                if nowColor == picture[newY][newX] {
                                    normalVisit[newY][newX] = 1
                                    stack.append([newY, newX])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if colorWeaknessVisit[i][j] == 0 {
                colorWeaknessVisit[i][j] = 1
                colorWeakness += 1
                stack.append([i,j])
                while(!stack.isEmpty) {
                    let now = stack.popLast()!
                    let nowColor = picture[now[0]][now[1]]
                    for k in 0..<dx.count {
                        let newX = now[1] + dx[k]
                        let newY = now[0] + dy[k]
                        
                        if newX < 0 || newX > n-1 || newY < 0 || newY > n-1 {
                            continue
                        } else {
                            if colorWeaknessVisit[newY][newX] == 1 {
                                continue
                            } else {
                                if nowColor == "G" || nowColor == "R" {
                                    if picture[newY][newX] == "G" || picture[newY][newX] == "R" {
                                        colorWeaknessVisit[newY][newX] = 1
                                        stack.append([newY, newX])
                                    }
                                } else if nowColor == "B" {
                                    if picture[newY][newX] == "B" {
                                        colorWeaknessVisit[newY][newX] = 1
                                        stack.append([newY, newX])
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    print("\(normal) \(colorWeakness)")
}

solution()
