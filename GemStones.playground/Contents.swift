import Foundation
import XCTest


class GemStones {
    
    func gemstones(arr: [String]) -> Int {
        
        guard arr.count > 0 else {
            return 0
        }
        
        var arr = arr.map{ Set($0) }
        
        guard arr.count > 1 else {
            return arr.first?.count ?? 0
        }
        
        var stones = arr.popLast()!
        for rock in arr {
            var tempStones = stones
            for mineral in stones {
                if !rock.contains(mineral) {
                    tempStones.remove(mineral)
                }
            }
            stones = tempStones
        }
        return stones.count
    }
}

class TestGemStones: XCTestCase {
    
    func testGemStonesZeroRocks() {
        let sut = GemStones()
        let rocks: [String] = []
        let stones = sut.gemstones(arr: rocks)
        XCTAssert(stones == 0)
    }
    
    func testGemStonesOneRock() {
        let sut = GemStones()
        let rocks = ["abcdde"]
        let stones = sut.gemstones(arr: rocks)
        XCTAssert(stones == 5)
    }
    
    func testGemStones() {
        let sut = GemStones()
        let rocks = ["abcdde","baccd","eeabg"]
        let stones = sut.gemstones(arr: rocks)
        XCTAssert(stones == 2)
    }
}

TestGemStones.defaultTestSuite.run()

