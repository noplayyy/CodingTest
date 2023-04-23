import Foundation

let n = Int(readLine()!)!

var cycle = 0
var newNumber = n

repeat {
    let sum = newNumber / 10 + newNumber % 10
    newNumber = newNumber % 10 * 10 + sum % 10
    cycle += 1
} while (n != newNumber)

print(cycle)