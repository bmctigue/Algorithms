import Foundation
import XCTest

private class HowManyGames {
    
    func howManyGames(p: Int, d: Int, m: Int, s: Int) -> Int {
        guard s >= p else {
            return 0
        }
        
        var totalGames = 0
        
        var totalCost = p
        totalGames += 1
        
        var newPrice = p - d
        while (newPrice > m) && (totalCost < s) {
            totalGames += 1
            totalCost += newPrice
            newPrice -= d
        }
        
        totalGames += Int((s - totalCost)/m)
        
        return totalGames
    }
}

private class TestHowManyGames: XCTestCase {
    
    lazy var sut = HowManyGames()
    
    func testNotEnoughMoney() {
        let p = 20
        let d = 3
        let m = 6
        let s = 10
        let totalGames = sut.howManyGames(p: p, d: d, m: m, s: s)
        XCTAssert(totalGames == 0)
    }

    func testHowManyGames() {
        let p = 20
        let d = 3
        let m = 6
        let s = 80
        let totalGames = sut.howManyGames(p: p, d: d, m: m, s: s)
        XCTAssert(totalGames == 6)
    }

    func testHowManyGames2() {
        let p = 20
        let d = 3
        let m = 6
        let s = 85
        let totalGames = sut.howManyGames(p: p, d: d, m: m, s: s)
        XCTAssert(totalGames == 7)
    }
    
    func testHowManyGames3() {
        let p = 100
        let d = 19
        let m = 1
        let s = 180
        let totalGames = sut.howManyGames(p: p, d: d, m: m, s: s)
        XCTAssert(totalGames == 1)
    }
}

TestHowManyGames.defaultTestSuite.run()
