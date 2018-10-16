import Foundation
import XCTest

class JumpingOnClouds {
    
    func jumpingOnClouds(c: [Int]) -> Int {
        var jumps = 0
        var currentCloud = 0
        
        while currentCloud < c.count - 1 {
            var cloudOffset = currentCloud + 2
            if cloudOffset < c.count && c[cloudOffset] == 0 {
                currentCloud = cloudOffset
                jumps += 1
            } else {
                cloudOffset -= 1
                if c[cloudOffset] == 0 {
                    currentCloud = cloudOffset
                    jumps += 1
                } else {
                    return 0
                }
            }
        }
        return jumps
    }
}

class JumpingOnCloudsTests: XCTestCase {
    
    func testJumpingOnClouds() {
        let sut = JumpingOnClouds()
        var result = sut.jumpingOnClouds(c: [0,0,1,0,0,1,0])
        XCTAssertEqual(result, 4)
        result = sut.jumpingOnClouds(c: [0,0,0,0,1,0])
        XCTAssertEqual(result, 3)
        result = sut.jumpingOnClouds(c: [0,0,0,1,0,0])
        XCTAssertEqual(result, 3)
    }
}

JumpingOnCloudsTests.defaultTestSuite.run()
