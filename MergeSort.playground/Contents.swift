import Foundation
import XCTest

func merge<T: Comparable>(arr1:[T], arr2:[T]) -> [T] {
    
    var arr1 = arr1
    var arr2 = arr2
    var result: [T] = []
    
    arr1 = arr1.reversed()
    arr2 = arr2.reversed()
    while arr1.count > 0 && arr2.count > 0 {
        if let arr1Last = arr1.last, let arr2Last = arr2.last {
            if arr1Last <= arr2Last {
                result.append(arr1Last)
                arr1.popLast()
            } else {
                result.append(arr2Last)
                arr2.popLast()
            }
        }

        if arr1.count == 0 {
            result += arr2.reversed()
        } else if arr2.count == 0 {
            result += arr1.reversed()
        }
    }
    return result
}

func mergeSort<T: Comparable>(_ arr:[T]) -> [T] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var arr = arr
    let split = arr.count/2
    let left = Array(arr[0..<split])
    let right = Array(arr[split..<arr.count])
    let arr1 = mergeSort(left)
    let arr2 = mergeSort(right)
    arr = merge(arr1: arr1, arr2: arr2)
    return arr
}

class MergeTests: XCTestCase {
    func testMergeArr1Short() {
        let arr1 = [1]
        let arr2 = [4,5,6]
        let mergedArray = merge(arr1: arr1, arr2: arr2)
        XCTAssert(mergedArray == [1,4,5,6])
    }

    func testMergeArr2Short() {
        let arr1 = [1,2,3]
        let arr2 = [4,5,]
        let mergedArray = merge(arr1: arr1, arr2: arr2)
        XCTAssert(mergedArray == [1,2,3,4,5])
    }
    
    func testMerge() {
        let arr1 = [1,4,6]
        let arr2 = [2,3,5]
        let mergedArray = merge(arr1: arr1, arr2: arr2)
        XCTAssert(mergedArray == [1,2,3,4,5,6])
    }
}

class MergeSortTests: XCTestCase {
    
    func testGuard() {
        var arr: [Int] = []
        var sortedArr = mergeSort(arr)
        XCTAssert(sortedArr.isEmpty)
        arr = [1]
        sortedArr = mergeSort(arr)
        XCTAssert(sortedArr.count == 1)
    }
    
    func testSortInt() {
        let arr = [5,4,3,2,1]
        let sortedArr = mergeSort(arr)
        XCTAssert(sortedArr == [1,2,3,4,5])
    }
    
    func testSortString() {
        let arr = ["Five","Four","Three","Two","One"]
        let sortedArr = mergeSort(arr)
        XCTAssert(sortedArr == ["Five","Four","One","Three","Two"])
    }
}

MergeTests.defaultTestSuite.run()
//MergeSortTests.defaultTestSuite.run()
