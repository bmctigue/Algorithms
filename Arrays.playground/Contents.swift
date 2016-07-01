//: Playground - noun: a place where people can play

import UIKit

// bubble sort

//let sourceArray: Array<Int> = []
//let sourceArray: Array<Int> = [3]
//let sourceArray: Array<Int> = [0,3]
//let sourceArray: Array<Int> = [3,0]
let sourceArray: Array<Int> = [3,66,7,1,9,0]
//let sourceArray: Array<Int> = [1,2,3,4,5,6]
//let sourceArray: Array<Int> = [6,5,4,3,2,1]

func bubbleSortForArray(testArray:Array<Int>) -> Array<Int> {
    if testArray.count < 2 {
        return testArray
    }
    var bubbleArray:Array<Int> = testArray
    let endIndex = bubbleArray.count-2
    var temp: Int
    var swapsPerformed = true
    while swapsPerformed {
        swapsPerformed = false
        for index in 0...endIndex {
            if bubbleArray[index] > bubbleArray[index+1] {
                temp = bubbleArray[index+1]
                bubbleArray[index+1] = bubbleArray[index]
                bubbleArray[index] = temp
                swapsPerformed = true
            }
        }
    }
    return bubbleArray
}

let bubbleResult = bubbleSortForArray(sourceArray)

// insertion sort

func insertionSortForArray(testArray:Array<Int>) -> Array<Int> {
    if testArray.count < 2 {
        return testArray
    }
    var insertionArray:Array<Int> = testArray
    let endIndex: Int = insertionArray.count-1
    var temp: Int
    var insertionIndex: Int = endIndex
    for _ in 0..<endIndex {
        // add last item in unsorted portion to the sorted portion
        insertionIndex -= 1
        // sort the unsorted portion
        for sortIndex in insertionIndex..<endIndex {
            if insertionArray[sortIndex] <= insertionArray[sortIndex+1] {
                break
            } else {
                temp = insertionArray[sortIndex+1]
                insertionArray[sortIndex+1] = insertionArray[sortIndex]
                insertionArray[sortIndex] = temp
            }
        }
    }
    
    return insertionArray
}

let insertionResult = insertionSortForArray(sourceArray)

var array1 = [2,3,1,0,2,5,3]

func findDuplicate() {
    var hash = [Int:Int]()
    for i in array1 {
        if hash[i] != nil {
            print("duplicate:\(i)")
            break
        }
        hash[i] = 1
    }
}

//findDuplicate()

func findDuplicate2() {
    var i : Int
    var j : Int
    for index in 0..<array1.count {
        i = array1[index]
        j = array1[i]
        if i != index {
            if i == j {
                print("duplicate:\(i)")
                break
            } else {
                array1[index] = j
                array1[i] = i
            }
        }
    }
}

//findDuplicate2()

//var matrix = [[1,2,3,4,6],[7,8,9,10,11]]
var matrix = [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]]

func findIncludedInMatrix(test:Int) {
    var included = false
    var result = "\(test) is not included"
    for testArray:Array in matrix {
        if test < testArray[0] {
            break
        }
        included = checkIfIncluded(testArray, test: test)
        if (included) {
            result = ("\(test) is included")
            break
        }
    }
    print("\(result)")
}

func checkIfIncluded(testArray:Array<Int>, test: Int) -> Bool {
    print("\(testArray)")
    if test > testArray[testArray.count-1] {
        return false
    } else {
        let found = searchArray(testArray, test: test)
        return found
    }
}

// binary search
func searchArray(testArray:Array<Int>, test: Int) -> Bool {
    let index:Int = testArray.count / 2
    let indexValue = testArray[index]
    print("index: \(index)")
    print("indexValue: \(indexValue)")
    var slice: Array<Int>
    var found: Bool
    if (testArray.count == 1) {
        if test == indexValue {
            found = true
        } else {
            found = false
        }
    } else {
        if test == indexValue {
            found = true
        } else if test < testArray[index] {
            slice = Array(testArray[0..<index])
            print("\(slice)")
            found = searchArray(slice, test:test)
        } else {
            slice = Array(testArray[index..<testArray.count])
            print("\(slice)")
            found = searchArray(slice, test:test)
        }
    }
    return found
}

findIncludedInMatrix(12)




