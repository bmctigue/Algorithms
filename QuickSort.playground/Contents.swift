import Foundation
import XCTest

func quickSort<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    var left = [T]()
    var right = [T]()
    
    let pivot = Int.random(in: 0..<arr.count)
    let partition = arr[pivot]
    let partitionArray: [T] = [partition]
    left = arr.filter { $0 < partition }
    right = arr.filter { $0 > partition}
    return quickSort(left) + partitionArray + quickSort(right)
}

class QuickSortTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = quickSort(arr)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = quickSort(arr)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testSortInt() {
        let arr = [5,4,3,2,1]
        let sortedArr = quickSort(arr)
        XCTAssert(sortedArr == [1,2,3,4,5])
    }
    
    func testSortString() {
        let arr = ["Five","Four","Three","Two","One"]
        let sortedArr = quickSort(arr)
        XCTAssert(sortedArr == ["Five","Four","One","Three","Two"])
    }
}

QuickSortTests.defaultTestSuite.run()
