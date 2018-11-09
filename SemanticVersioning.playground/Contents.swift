import Foundation
import XCTest

class VersionString: Comparable {
    
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    static func < (lhs: VersionString, rhs: VersionString) -> Bool {
        let lhsArr = lhs.text.split(separator: ".")
        let rhsArr = rhs.text.split(separator: ".")
        if lhsArr[2] < rhsArr[2] {
            return true
        } else if lhsArr[1] < rhsArr[1] {
            return true
        } else if lhsArr[0] < rhsArr[0] {
            return true
        }
        return false
    }
    
    static func == (lhs: VersionString, rhs: VersionString) -> Bool {
        return lhs.text == rhs.text
    }
    
    
    static func isValid(lhs: VersionString, rhs: VersionString) -> Bool {
        
        return true
    }
}

class SemanticVersioningTests: XCTestCase {
    
    func testVersion() {
        let vString1 = VersionString("0.0.0")
        let vString2 = VersionString("0.0.1")
        XCTAssert(vString1 < vString2)
        
    }
}

SemanticVersioningTests.defaultTestSuite.run()
