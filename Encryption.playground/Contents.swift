import Foundation
import XCTest

class Encryption {
    
    func encryption(s: String) -> String {
        let splitter = sqrt(Double(s.count))
        let cols = Int(ceil(splitter))
        var rows = Int(floor(splitter))
        if rows * cols < s.count {
            rows += 1
        }
        let sArray = s.map{String($0)}
        var result: String = ""
        for col in 0..<cols {
            var indexOutOfBounds = false
            for row in 0..<rows {
                let index = ((row * cols)) + col
                indexOutOfBounds = index >= sArray.count
                if indexOutOfBounds {
                    break
                }
                result += sArray[index]
            }
            result += " "
        }
        
        result = result.trimmingCharacters(in: .whitespaces)
        return result
    }
}

class EncryptionTests: XCTestCase {
    
    func testAppendDelete() {
        let sut = Encryption()
        var result = sut.encryption(s: "haveaniceday")
        XCTAssert(result == "hae and via ecy")
        result = sut.encryption(s: "feedthedog")
        XCTAssert(result == "fto ehg ee dd")
        result = sut.encryption(s: "chillout")
        XCTAssert(result == "clu hlt io")
        result = sut.encryption(s: "iffactsdontfittotheorychangethefacts")
        XCTAssert(result == "isieae fdtonf fotrga anoyec cttctt tfhhhs")
    }
    
}

EncryptionTests.defaultTestSuite.run()
