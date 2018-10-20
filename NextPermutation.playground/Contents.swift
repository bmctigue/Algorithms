import Foundation
import XCTest

class BiggerIsGreater {
    
    func biggerIsGreater(w: String) -> String {
        let arr = w.map{ String($0) }
        return nextPermutation(array: arr)
    }
    
    func nextPermutation(array: [String]) -> String {
        var array = array
        var i = array.count - 1
        while (i > 0 && array[i - 1] >= array[i]) {
            i -= 1
        }
    
        if (i <= 0) {
            return "no answer"
        }
    
        var j = array.count - 1
    
        while (array[j] <= array[i - 1]) {
            j -= 1
        }
    
        var temp = array[i - 1]
        array[i - 1] = array[j]
        array[j] = temp
    
        j = array.count - 1
    
        while (i < j) {
            temp = array[i]
            array[i] = array[j]
            array[j] = temp
            i += 1
            j -= 1
        }
    
        return array.joined()
    }
}

class BiggerIsGreaterTests: XCTestCase {
    
    func testBiggerIsGreater() {
        let sut = BiggerIsGreater()
        var result = sut.biggerIsGreater(w: "ab")
        XCTAssert(result == "ba")
        result = sut.biggerIsGreater(w: "bb")
        XCTAssert(result == "no answer")
        result = sut.biggerIsGreater(w: "hefg")
        XCTAssert(result == "hegf")
        result = sut.biggerIsGreater(w: "dhck")
        XCTAssert(result == "dhkc")
        result = sut.biggerIsGreater(w: "dkhc")
        XCTAssert(result == "hcdk")
        result = sut.biggerIsGreater(w: "fedcbabcd")
        XCTAssert(result == "fedcbabdc")
    }
}

BiggerIsGreaterTests.defaultTestSuite.run()
