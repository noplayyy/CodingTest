import Foundation

var colors = [Character: Int]()
var nums = [Int: Int]()
var maxNum = 0

for _ in 1...5 {
    if let input = readLine() {
        let components = input.split(separator: " ")
        if components.count == 2, let color = components[0].first, let num = Int(components[1]) {
            colors[color, default: 0] += 1
            nums[num, default: 0] += 1
            maxNum = max(maxNum, num)
        }
    }
}

var score = 0

if colors.count == 1 && nums.keys.max()! - nums.keys.min()! == 4 {
    score = maxNum + 900
} else if nums.values.max() == 4 {
    score = nums.filter({$0.value == 4}).keys.first! + 800
} else if nums.values.max() == 3 && nums.values.min() == 2 {
    let threeNum = nums.filter({$0.value == 3}).keys.first!
    let twoNum = nums.filter({$0.value == 2}).keys.first!
    score = threeNum * 10 + twoNum + 700
} else if colors.count == 1 {
    score = maxNum + 600
} else if nums.keys.max()! - nums.keys.min()! == 4 {
    score = maxNum + 500
} else if nums.values.max() == 3 {
    score = nums.filter({$0.value == 3}).keys.first! + 400
} else if nums.filter({$0.value == 2}).count == 2 {
    let twoNums = nums.filter({$0.value == 2}).keys.sorted()
    let bigNum = max(twoNums[0], twoNums[1])
    let smallNum = min(twoNums[0], twoNums[1])
    score = bigNum * 10 + smallNum + 300
} else if nums.filter({$0.value == 2}).count == 1 {
    score = nums.filter({$0.value == 2}).keys.first! + 200
} else {
    score = maxNum + 100
}

print(score)
