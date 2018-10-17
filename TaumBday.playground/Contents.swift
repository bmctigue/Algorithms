import Foundation
import XCTest

class TaumBday {
    
    func taumBday(b: Int, w: Int, bc: Int, wc: Int, z: Int) -> Int {
        var totalCost: Int = 0
        if z >= abs(bc - wc) {
            totalCost = (b * bc) + (w * wc)
        } else {
            let minCost = min(bc,wc)
            totalCost = minCost * (b + w)
            if bc < wc {
                totalCost += w * z
            } else {
                totalCost += b * z
            }
        }
        return totalCost
    }
}

class TaumBdayTests: XCTestCase {
    
    func testTaumBday() {
        let sut = TaumBday()
        var result = sut.taumBday(b: 10, w: 10, bc: 1, wc: 1, z: 1)
        XCTAssertEqual(result, 20)
        result = sut.taumBday(b: 5, w: 9, bc: 2, wc: 3, z: 4)
        XCTAssertEqual(result, 37)
        result = sut.taumBday(b: 3, w: 6, bc: 9, wc: 1, z: 1)
        XCTAssertEqual(result, 12)
        result = sut.taumBday(b: 7, w: 7, bc: 4, wc: 2, z: 1)
        XCTAssertEqual(result, 35)
        result = sut.taumBday(b: 3, w: 3, bc: 1, wc: 9, z: 2)
        XCTAssertEqual(result, 12)
    }
}

TaumBdayTests.defaultTestSuite.run()
