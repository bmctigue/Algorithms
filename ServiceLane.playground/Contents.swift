import Foundation
import XCTest


class ServiceLane {
    
    var width = [Int]()
    
    func serviceLane(n: Int, cases: [[Int]]) -> [Int] {
        var results = [Int]()
        
        for item in cases {
            guard item.min() ?? -1 >= 0 else {
                break
            }
            
            guard width.count > item.max() ?? Int.max else {
                break
            }
            
            let range = item.first!...item.last!
            let widthSlice = Array(width[range])
            results.append(widthSlice.min()!)
        }
        
        return results
    }
}

class TestServiceLane: XCTestCase {
    
    func testServiceLane1() {
        let sut = ServiceLane()
        sut.width = [2,3,1,2,3,2,3,3]
        let cases = [[0,3],[4,6],[6,7],[3,5],[0,7]]
        let results = sut.serviceLane(n: sut.width.count, cases: cases)
        XCTAssert(results == [1,2,3,2,1])
    }
    
    func testServiceLane2() {
        let sut = ServiceLane()
        sut.width = [1,2,2,2,1]
        let cases = [[2,3],[1,4],[2,4],[2,4],[2,3]]
        let results = sut.serviceLane(n: sut.width.count, cases: cases)
        XCTAssert(results == [2,1,1,1,2])
    }
    
}

TestServiceLane.defaultTestSuite.run()

