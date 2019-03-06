import Foundation
import XCTest

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r == 0 {
        return b
    }
    return gcd(b, r)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    let d = gcd(a, b)
    return (a/d) * b
}

func lcm(_ arr: [Int]) -> Int {
    guard arr.count > 0 else {
        return 0
    }
    
    guard arr.count != 1 else {
        return arr.first!
    }
    
    let first = arr[0]
    let second = arr[1]
    var l = lcm(first, second)
    for i in 2..<arr.count {
        l = lcm(l, arr[i])
    }
    return l
}

func lcmsForArray(_ inputArr: [Int], _ arr: [Int]) -> [Int] {
    var lcms = [Int]()
    
    let lowestCommon = lcm(inputArr)
    let maxArray = arr.min() ?? 0
    var currentLowest = lowestCommon
    repeat {
        lcms.append(currentLowest)
        currentLowest += lowestCommon
    } while currentLowest <= maxArray
    
    return lcms
}

class BetweenTwoSets {
    
    func getTotalX(a: [Int], b: [Int]) -> Int {
        var between = 0
        let l = lcmsForArray(a, b)
        
        for i in l {
            var dividesEvenly = true
            for j in b {
                if j % i != 0 {
                    dividesEvenly = false
                    break
                }
            }
            if dividesEvenly == true {
                between += 1
            }
        }
        return between
    }
}


class BetweenTwoSetsTests: XCTestCase {
    
    func testGCD() {
        let g = gcd(2,6)
        XCTAssertEqual(g,2)
    }

    func testLCM() {
        var l = lcm(2,6)
        XCTAssertEqual(l,6)
        l = lcm(2,4)
        XCTAssertEqual(l,4)
    }
    
    func testLCMArray() {
        var l = lcm([2,6])
        XCTAssertEqual(l,6)
        l = lcm([2,4])
        XCTAssertEqual(l,4)
    }

    func testLCMS() {
        let l = lcmsForArray([2, 4], [16,32,96])
        XCTAssertEqual(l,[4, 8, 12, 16])
    }

    func testBetweenTwoSets() {
        let sut = BetweenTwoSets()
        var between = sut.getTotalX(a: [2,4], b: [16,32,96])
        XCTAssertEqual(between,3)
        between = sut.getTotalX(a: [2,6], b: [24,36])
        XCTAssertEqual(between,2)
        between = sut.getTotalX(a: [2], b: [20,30,12])
        XCTAssertEqual(between,1)
        between = sut.getTotalX(a: [3,9,6], b: [36,72])
        XCTAssertEqual(between,2)
        between = sut.getTotalX(a: [1], b: [100])
        XCTAssertEqual(between,9)
        between = sut.getTotalX(a: [1], b: [72,48])
        XCTAssertEqual(between,8)
    }
}

BetweenTwoSetsTests.defaultTestSuite.run()
