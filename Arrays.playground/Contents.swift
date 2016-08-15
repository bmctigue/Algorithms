//: Playground - noun: a place where people can play

import UIKit

// bubble sort

//let sourceArray: Array<Int> = []
//let sourceArray: Array<Int> = [3]
//let sourceArray: Array<Int> = [0,3]
//let sourceArray: Array<Int> = [3,0]
//let sourceArray: Array<Int> = [3,1,2]
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

func bubbleSortForArray2(testArray:Array<Int>) -> Array<Int> {
    var bubbleArray:Array<Int> = testArray
    if testArray.count <= 2 {
        if testArray.count == 2 {
            return checkAndSwap(bubbleArray, index: 0)
        }
        return testArray
    }
    
    let endIndex = bubbleArray.count-2
    var innerEndIndex = endIndex
    for _ in 0...endIndex {
        for innerIndex in 0...innerEndIndex {
            bubbleArray = checkAndSwap(bubbleArray, index: innerIndex)
        }
        innerEndIndex -= 1
    }
    return bubbleArray
}

// selection sort

func selectionSort(testArray: Array<Int>) -> Array<Int> {
    var selectionArray:Array<Int> = testArray
    var temp: Int
    if testArray.count <= 2 {
        if testArray.count == 2 {
            return checkAndSwap(selectionArray, index: 0)
        }
        return testArray
    }
    for index in 0...selectionArray.count-2 {
        var minIndex = index
        for selectionIndex in index+1..<selectionArray.count {
            if selectionArray[selectionIndex] < selectionArray[minIndex] {
                minIndex = selectionIndex
            }
        }
        temp = selectionArray[index]
        selectionArray[index] = selectionArray[minIndex]
        selectionArray[minIndex] = temp
    }
    return selectionArray
}

func checkAndSwap(bubbleArray: Array<Int>, index: Int) -> Array<Int> {
    var bubbleArray = bubbleArray
    var temp: Int
    if bubbleArray[index] > bubbleArray[index+1] {
        temp = bubbleArray[index+1]
        bubbleArray[index+1] = bubbleArray[index]
        bubbleArray[index] = temp
    }
    return bubbleArray
}

let selectionResult = selectionSort(sourceArray)
//
//let bubbleResult = bubbleSortForArray(sourceArray)
//let bubbleResult2 = bubbleSortForArray2(sourceArray)

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

//let insertionResult = insertionSortForArray(sourceArray)

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
    }
    let found = searchArray(testArray, test: test)
    return found
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
        found = test == indexValue
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

// merge sort

func mergeSort(unsortedArray:Array<Int>) -> Array<Int> {
    let unsorted: Array<Int> = unsortedArray
    var workingArrays: Array<Array<Int>> = []
    
    if (unsorted.count < 2) {
        return unsorted
    }
    
    for item:Int in unsorted {
        workingArrays.append([item])
    }
    workingArrays = colateArrays(workingArrays)
    return workingArrays[0]
}

func colateArrays(arraysToColate: Array<Array<Int>>) -> Array<Array<Int>> {
    print("arraysToColate: \(arraysToColate)")
    var workingArrays: Array<Array<Int>> = arraysToColate
    var tempArrays: Array<Array<Int>> = []
    var colatedArray: Array<Int>
    var workingArray1: Array<Int>
    var workingArray2: Array<Int>
    while workingArrays.count > 0 {
        workingArray1 = workingArrays[0]
        workingArrays.removeFirst()
        if workingArrays.count == 0 {
            colatedArray = workingArray1
        } else {
            workingArray2 = workingArrays[0]
            workingArrays.removeFirst()
            colatedArray = colate(workingArray1, array2: workingArray2)
        }
        tempArrays.append(colatedArray)
    }
    if tempArrays.count > 1 {
        tempArrays = colateArrays(tempArrays)
    }
    return tempArrays
}

func colate(array1:Array<Int>, array2:Array<Int>) -> Array<Int> {
    var firstArray = array1
    var secondArray = array2
    var resultArray: Array<Int> = []
    let totalCount = array1.count + array2.count
    for _ in 0...totalCount {
        if (firstArray.count == 0) {
            resultArray.appendContentsOf(secondArray)
            break
        }
        if (secondArray.count == 0) {
            resultArray.appendContentsOf(firstArray)
            break
        }
        if (firstArray.first <= secondArray.first) {
            resultArray.append(firstArray.removeFirst())
            
        } else {
            resultArray.append(secondArray.removeFirst())
        }
    }
    return resultArray
}

var testArray1: Array<Int> = [1,2]
var testArray2: Array<Int> = [2,3,6,8]
//var result = colate(testArray1,array2:testArray2)

var testArray: Array<Int> = [110,3,2,4,99,32,1,0,22,31,53,6,1000,654,2,45]
//var testArray: Array<Int> = [3,2,1,5,9]
//var testArray: Array<Int> = [3,2,4]
//var result = mergeSort(testArray)

