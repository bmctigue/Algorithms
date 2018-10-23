import Foundation
import XCTest

class CaesarCipher {
    
    func caesarCipher(s: String, k: Int) -> String {
        let lowerCase = "abcdefghijklmnopqrstuvwxyz"
        var lowerHash = [String:String]()
        var upperHash = [String:String]()
        
        
        let lowerArray = lowerCase.map { String($0) }
        var rotatedLowerArray = rotateArray(arr: lowerArray, k: k)
        let upperArray = lowerCase.uppercased().map { String($0) }
        var rotatedUpperArray = rotateArray(arr: upperArray, k: k)
        
        for i in 0..<lowerArray.count {
            lowerHash[lowerArray[i]] = rotatedLowerArray[i]
            upperHash[upperArray[i]] = rotatedUpperArray[i]
        }

        let stringArray = s.map { String($0) }
        var code = ""
        for char in stringArray {
            if lowerHash[char] != nil {
                code += lowerHash[char]!
            } else if upperHash[char] != nil {
                code += upperHash[char]!
            } else {
                code += char
            }
        }
        
        return code
    }
    
    func rotateArray(arr:[String], k: Int) -> [String] {
        
        guard k > 0 else {
            return arr
        }
        
        var arr = arr
        for _ in 1...k {
            arr.append(arr.remove(at: 0))
        }
        return arr
    }
}

class CaesarCipherTests: XCTestCase {
    
    func testCaesarCipher() {
        let sut = CaesarCipher()
        var result = sut.caesarCipher(s: "middle-Outz", k: 2)
        XCTAssert(result == "okffng-Qwvb")
        result = sut.caesarCipher(s: "Hello_World!", k: 4)
        XCTAssert(result == "Lipps_Asvph!")
        result = sut.caesarCipher(s: "www.abc.xy", k: 87)
        XCTAssert(result == "fff.jkl.gh")
        result = sut.caesarCipher(s: "www.abc.xy", k: 87)
        XCTAssert(result == "fff.jkl.gh")
        result = sut.caesarCipher(s: "D3q4", k: 0)
        XCTAssert(result == "D3q4")
        
    }
}

CaesarCipherTests.defaultTestSuite.run()
