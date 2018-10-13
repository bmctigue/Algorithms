import Foundation
import XCTest

func swap<T>(_ arr:[T], i:Int, j:Int) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
    return arr
}

func selectionSort<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    var smallestValue = arr[0]
    var k: Int?
    for i in 0..<arr.count-1 {
        smallestValue = arr[i]
        k = nil
        for j in i+1..<arr.count {
            if arr[j] < smallestValue {
                k = j
                smallestValue = arr[j]
            }
        }
        if let k = k {
            arr = swap(arr, i: i, j: k)
        }
    }
    return arr
}

class SwapTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = swap(arr, i: 0, j: 0)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = swap(arr, i: 0, j: 0)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testSwap() {
        let arr = [1,2,3]
        let sortedArr = swap(arr, i: 0, j: 2)
        XCTAssert(sortedArr == [3,2,1])
    }
}

class SelectionSortTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = selectionSort(arr)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = selectionSort(arr)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testSortInt() {
        let arr = [5,4,3,2,1]
        let sortedArr = selectionSort(arr)
        XCTAssert(sortedArr == [1,2,3,4,5])
    }
    
    func testSortString() {
        let arr = ["Five","Four","Three","Two","One"]
        let sortedArr = selectionSort(arr)
        XCTAssert(sortedArr == ["Five","Four","One","Three","Two"])
    }
}

SwapTests.defaultTestSuite.run()
SelectionSortTests.defaultTestSuite.run()
