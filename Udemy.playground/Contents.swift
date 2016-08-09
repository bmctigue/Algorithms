//: Playground - noun: a place where people can play

import UIKit

// Euclid find the greatest common denominator of 2 integers, m > n

func findGCD(m: Int, n:Int) -> Int {
    var result: Int
    let r = m % n
    if r == 0 {
        result = n
    } else {
        result = findGCD(n, n: r)
    }
    return result
}

findGCD(2, n: 1)
findGCD(4, n: 2)
findGCD(20, n: 16)
findGCD(15, n: 12)
findGCD(100, n: 75)