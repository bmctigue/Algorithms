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

func insertionSort<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    for i in 1..<arr.count {
        var j = i
        while arr[j] < arr[j-1] {
            arr = swap(arr, i: j, j: j-1)
            j -= 1
            if j == 0 {
                break
            }
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

class InsertionSortTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = insertionSort(arr)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = insertionSort(arr)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testSortInt() {
        let arr = [5,4,3,2,1]
        let sortedArr = insertionSort(arr)
        XCTAssert(sortedArr == [1,2,3,4,5])
    }
    
    func testSortString() {
        let arr = ["Five","Four","Three","Two","One"]
        let sortedArr = insertionSort(arr)
        XCTAssert(sortedArr == ["Five","Four","One","Three","Two"])
    }
}

SwapTests.defaultTestSuite.run()
InsertionSortTests.defaultTestSuite.run()
