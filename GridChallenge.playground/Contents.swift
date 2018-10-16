import Foundation
import XCTest

class GridChallenge {
    
    func gridChallenge(grid: [String]) -> String {
        
        guard grid.count > 0 else {
            return "NO"
        }
        
        let length = grid.first?.count ?? 0
        var sArrays = [[String]]()
        for s in grid {
            sArrays.append(s.map{String($0)}.sorted())
        }
        
        for i in 0..<length {
            for j in 0..<length-1 {
                if sArrays[j][i] > sArrays[j+1][i] {
                    return "NO"
                }
            }
        }
        return "YES"
    }
}

class GridChallengeTests: XCTestCase {
    
    func testGridChallenge() {
        let sut = GridChallenge()
        let result = sut.gridChallenge(grid: ["ebacd","fghij","olmkn","trpqs","xywuv"])
        XCTAssert(result == "YES")
    }
    
}

GridChallengeTests.defaultTestSuite.run()
