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

func left(_ i: Int) -> Int {
    return (2 * i) + 1
}

func right(_ i: Int) -> Int {
    return (2 * i) + 2
}

func parent(_ i: Int) -> Int {
    return Int(floor(Double(i-1)/Double(2)))
}

func heapifyUp<T: Comparable>(_ arr: [T], cIndex: Int) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var cIndex = cIndex
    var c = arr[cIndex]
    var pIndex = parent(cIndex)
    var p = arr[pIndex]
    var arr = arr
    
    while c < p {
        arr = swap(arr, i: pIndex, j: cIndex)
        cIndex = pIndex
        if cIndex == 0 {
            break
        }
        c = arr[cIndex]
        pIndex = parent(cIndex)
        p = arr[pIndex]
    }
    
    return arr
}

func heapifyDown<T: Comparable>(_ arr: [T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var pIndex = 0
    var cIndex = smallestChildIndex(arr, parentIndex: pIndex)
    if cIndex == nil {
        return arr
    }
    var p = arr[pIndex]
    var c = arr[cIndex!]
    var arr = arr
    
    while c < p {
        arr = swap(arr, i: pIndex, j: cIndex!)
        pIndex = cIndex!
        if pIndex == arr.count-1 {
            break
        }
        p = arr[pIndex]
        cIndex = smallestChildIndex(arr, parentIndex: pIndex)
        if cIndex == nil {
            break
        }
        c = arr[cIndex!]
    }
    return arr
}

func smallestChildIndex<T: Comparable>(_ arr: [T], parentIndex: Int) -> Int? {
    let size = arr.count
    let leftChildIndex = left(parentIndex)
    let rightChildIndex = right(parentIndex)
    if leftChildIndex < size {
        if rightChildIndex < size {
            if arr[leftChildIndex] < arr[rightChildIndex] {
                return leftChildIndex
            } else {
                return rightChildIndex
            }
        } else {
            return leftChildIndex
        }
    }
    return nil
}

func heapify<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    for i in 1..<arr.count {
        arr = heapifyUp(arr, cIndex: i)
    }
    return arr
}

func heapSort<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    var sorted = [T]()
    
    arr = heapify(arr)
    while arr.count > 1 {
        arr = swap(arr, i: 0, j: arr.count-1)
        sorted.append(arr.popLast()!)
        arr = heapifyDown(arr)
    }
    sorted += arr
    return sorted
}

class HeapSortTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = heapSort(arr)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = heapSort(arr)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testLeft() {
        XCTAssert(left(1) == 3)
    }

    func testRight() {
        XCTAssert(right(1) == 4)
    }

    func testParent() {
        XCTAssert(parent(3) == 1)
        XCTAssert(parent(5) == 2)
    }
    
    func testHeapifyUp() {
        let arr = [10,15,20,17,8]
        let heapifiedArr = heapifyUp(arr, cIndex: arr.count-1)
        XCTAssert(heapifiedArr == [8,10,20,17,15])
    }
    
    func testHeapifyDown() {
        let arr = [20,10,15,17,25]
        let heapifiedArr = heapifyDown(arr)
        XCTAssert(heapifiedArr == [10,17,15,20,25])
    }
    
    func testSmallestChildIndex() {
        var arr = [0]
        var smallestIndex = smallestChildIndex(arr, parentIndex: 0)
        XCTAssertNil(smallestIndex)
        arr = [0,1,3]
        smallestIndex = smallestChildIndex(arr, parentIndex: 0)
        XCTAssert(smallestIndex == 1)
        arr = [0,3,1]
        smallestIndex = smallestChildIndex(arr, parentIndex: 0)
        XCTAssert(smallestIndex == 2)
    }
    
    func testHeapify() {
        let arr = [10,15,20,17,8]
        let heap = heapify(arr)
        XCTAssert(heap == [8,10,20,17,15])
    }
    
    func testSortInt() {
        let arr = [5,4,3,2,1]
        let sortedArr = heapSort(arr)
        XCTAssert(sortedArr == [1,2,3,4,5])
    }

    func testSortString() {
        let arr = ["Five","Four","Three","Two","One"]
        let sortedArr = heapSort(arr)
        XCTAssert(sortedArr == ["Five","Four","One","Three","Two"])
    }
}

HeapSortTests.defaultTestSuite.run()
