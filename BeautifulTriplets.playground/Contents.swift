import Foundation
import XCTest


class BeautifulTriplets {
    
    func beautifulTriplets(d: Int, arr: [Int]) -> Int {
        var triplets = 0
        var hash = [Int:Int]()
        
        for (index,value) in arr.enumerated() {
            hash[value] = index
        }
        
        for value in arr {
            let secondValue = value + d
            let thirdValue = secondValue + d
            if let secondIndex = hash[secondValue], let firstIndex = hash[value],  secondIndex > firstIndex {
                if let thirdIndex = hash[thirdValue], thirdIndex > secondIndex {
                    triplets += 1
                }
            }
        }
        
        return triplets
    }
}

class TestBeautifulTriplets: XCTestCase {
    
    func testTriplets() {
        let d = 3
        let arr = [1,2,4,5,7,8,10]
        let sut = BeautifulTriplets()
        let triplets = sut.beautifulTriplets(d: d, arr: arr)
        XCTAssert(triplets == 3)
    }
    
}

TestBeautifulTriplets.defaultTestSuite.run()


