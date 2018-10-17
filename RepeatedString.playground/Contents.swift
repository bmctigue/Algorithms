//: Playground - noun: a place where people can play

import Foundation

func repeatedString(s: String, n: Int) -> Int {
    var count = 0
    
    if n < s.count {
        return aCountFor(s: s, offset: n)
    }
    
    let baseCount = aCountFor(s: s, offset: s.count)
    let repetitions = n / s.count
    count = baseCount * repetitions
    
    if n > s.count {
        let overCount = n % s.count
        count += aCountFor(s: s, offset: overCount)
    }

    return count
}

func aCountFor(s: String, offset: Int) -> Int {
    var s = s
    let startIndex = s.index(s.startIndex, offsetBy: 0)
    let endIndex = s.index(s.startIndex, offsetBy: offset)
    s = String(s[startIndex..<endIndex])
    let aArray = s.filter { $0 == "a" }
    return aArray.count
}


//let s = "aba"
//let n = 10

let s = "abcac"
let n = 10

//let s = "a"
//let n = 1000000000000

//let s = "ababa"
//let n = 3


print(repeatedString(s: s, n: n))
