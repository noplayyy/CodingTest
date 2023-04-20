import Foundation

let n: Int = Int(readLine()!)!
let limit = 1004000

func sortationPrimes() -> [Int] {
    var arr = [false, false] + Array(repeating: true, count: limit - 1)
    var primes = [Int]()
    
    for i in 2...limit {
        if arr[i] {
            for j in stride(from: i*1, through: limit, by: i) {
                arr[j] = false
            }
            if i >= n {
                primes.append(i)
            }
        }
    }
    return primes
}

func isPalindrome(_ x: Int) -> Bool {
    let str = String(x)
    return str == String(str.reversed())
}

let primes = sortationPrimes()

for prime in primes {
    if isPalindrome(prime) {
        print(prime)
        break
    }
}
