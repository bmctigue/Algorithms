import Foundation
import XCTest

func minimumDistances(a: [Int]) -> Int {
    var minDistance = a.count + 1
    let startingMinDistance = minDistance
    var indexHash = [Int: [Int]]()
    
    for (i,value) in a.enumerated() {
        if var indexArray = indexHash[value] {
            for index in indexArray {
                let distance = i - index
                minDistance = distance < minDistance ? distance : minDistance
                indexArray.append(i)
            }
        } else {
            indexHash[value] = [i]
        }
    }
    return minDistance < startingMinDistance ? minDistance : -1
}



class MinimumDistancesTests: XCTestCase {
    
    func testMinimumDistance() {
        var arr = [7,1,3,4,1,7]
        var minDistance = minimumDistances(a: arr)
        XCTAssert(minDistance == 3)
        arr = [3,2,1,2,3]
        minDistance = minimumDistances(a: arr)
        XCTAssert(minDistance == 2)
        arr = [1,2,3,4,10]
        minDistance = minimumDistances(a: arr)
        XCTAssert(minDistance == -1)
    }
}

MinimumDistancesTests.defaultTestSuite.run()

