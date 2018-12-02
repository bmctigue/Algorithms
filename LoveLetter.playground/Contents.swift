import Foundation
import XCTest

class LoveLetter {
    
    func theLoveLetterMystery(s: String) -> Int {
        let chars = s.compactMap{$0.unicodeScalars.first?.value}.map{Int($0)}
        guard s.count > 1 else {
            return 0
        }
        
        var operations = 0
        
        var i = 0
        var j = chars.count - 1
        while j > i {
            operations += abs(chars[i] - chars[j])
            i += 1
            j -= 1
        }
        return operations
    }
}

class TestLoveLetter: XCTestCase {
    func testA() {
        let sut = LoveLetter()
        let operations = sut.theLoveLetterMystery(s: "a")
        XCTAssert(operations == 0)
    }
    
    func testAbc() {
        let sut = LoveLetter()
        let operations = sut.theLoveLetterMystery(s: "abc")
        XCTAssert(operations == 2)
    }
    
    func testAbcba() {
        let sut = LoveLetter()
        let operations = sut.theLoveLetterMystery(s: "abcba")
        XCTAssert(operations == 0)
    }
    
    func testAbcd() {
        let sut = LoveLetter()
        let operations = sut.theLoveLetterMystery(s: "abcd")
        XCTAssert(operations == 4)
    }
    
    func testCba() {
        let sut = LoveLetter()
        let operations = sut.theLoveLetterMystery(s: "cba")
        XCTAssert(operations == 2)
    }
}

TestLoveLetter.defaultTestSuite.run()

