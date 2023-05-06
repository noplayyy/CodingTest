import Foundation

var n: Int = 0
if let input = readLine() {
    n = Int(input) ?? 0
}

var kbs1_idx: Int = -1
var kbs2_idx: Int = -1

for i in 0..<n {
    if let chnl = readLine() {
        if chnl == "KBS1" {
            kbs1_idx = i
        } else if chnl == "KBS2" {
            kbs2_idx = i
        }
    }
}

if kbs1_idx > kbs2_idx {
    kbs2_idx += 1
}

for _ in 0..<kbs1_idx {
    print("1", terminator: "")
}
for _ in 0..<kbs1_idx {
    print("4", terminator: "")
}

if kbs2_idx != 1 {
    for _ in 0..<kbs2_idx {
        print("1", terminator: "")
    }
    for _ in 1..<kbs2_idx {
        print("4", terminator: "")
    }
}
