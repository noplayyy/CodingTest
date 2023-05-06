import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0]
let K = input[1]

var countries = [(id: Int, gold: Int, silver: Int, bronze: Int)]()

for _ in 1...N {
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    countries.append((id: info[0], gold: info[1], silver: info[2], bronze: info[3]))
}

countries.sort { (a, b) -> Bool in
    if a.gold != b.gold {
        return a.gold > b.gold
    } else if a.silver != b.silver {
        return a.silver > b.silver
    } else if a.bronze != b.bronze {
        return a.bronze > b.bronze
    } else {
        return false
    }
}

var rank = 1
var sameRankCount = 1

for i in 0..<N {
    if countries[i].id == K {
        print(rank)
        break
    }
    if i > 0 {
        if countries[i].gold == countries[i-1].gold && countries[i].silver == countries[i-1].silver && countries[i].bronze == countries[i-1].bronze {
            sameRankCount += 1
        } else {
            rank += sameRankCount
            sameRankCount = 1
        }
    }
}
