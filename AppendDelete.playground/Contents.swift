import Foundation
import XCTest

class AppendDelete {
    
    var sArray: [String]!
    var tArray: [String]!
    
    func appendAndDelete(s: String, t: String, k: Int) -> String {
        self.sArray = s.map{String($0)}
        self.tArray = t.map{String($0)}
        let smallestCount = min(sArray.count,tArray.count)
        
        var count = 0
        for i in 0..<smallestCount {
            if sArray[i] == tArray[i] {
                count += 1
                if (sArray.count - count) + (tArray.count - count) == k {
                    return "Yes"
                }
            } else {
                break
            }
        }
        
        let adjustment = (sArray.count - count) + (tArray.count - count)
        if sArray.count < tArray.count {
            if adjustment == k {
                return "Yes"
            }
        } else {
            if adjustment <= k {
                return "Yes"
            }
        }
        
        return "No"
    }
}

class AppendDeleteTests: XCTestCase {
    
    func testAppendDelete() {
        let sut = AppendDelete()
        var result = sut.appendAndDelete(s: "abc", t: "def", k: 6)
        XCTAssert(result == "Yes")
        result = sut.appendAndDelete(s: "hackerhappy", t: "hackerrank", k: 9)
        XCTAssert(result == "Yes")
        result = sut.appendAndDelete(s: "aba", t: "aba", k: 7)
        XCTAssert(result == "Yes")
        result = sut.appendAndDelete(s: "ashley", t: "ash", k: 2)
        XCTAssert(result == "No")
        result = sut.appendAndDelete(s: "qwerasdf", t: "qwerbsdf", k: 6)
        XCTAssert(result == "No")
        result = sut.appendAndDelete(s: "y", t: "yu", k: 2)
        XCTAssert(result == "No")
        result = sut.appendAndDelete(s: "abcd", t: "abcdert", k: 10)
        XCTAssert(result == "No")
        result = sut.appendAndDelete(s: "zzzzz", t: "zzzzzzz", k: 4)
        XCTAssert(result == "Yes")
    }
    
}

AppendDeleteTests.defaultTestSuite.run()
