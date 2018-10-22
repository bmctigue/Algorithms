import Foundation
import XCTest

class ChocolateFeast {
    
    func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
        var wrappers = n/c
        var result = wrappers
        while wrappers >= m {
            let temp  = wrappers/m
            wrappers = temp + wrappers % m
            result += temp
        }
        return result
    }
}

class ChocolateFeastTests: XCTestCase {
    
    func testAppendDelete() {
        let sut = ChocolateFeast()
        var result = sut.chocolateFeast(n: 10, c: 2, m: 5)
        XCTAssert(result == 6)
        result = sut.chocolateFeast(n: 12, c: 4, m: 4)
        XCTAssert(result == 3)
        result = sut.chocolateFeast(n: 6, c: 2, m: 2)
        XCTAssert(result == 5)
        result = sut.chocolateFeast(n: 78711, c: 514, m: 63338)
        XCTAssert(result == 153)
    }
    
}

ChocolateFeastTests.defaultTestSuite.run()
