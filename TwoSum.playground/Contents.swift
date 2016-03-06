import UIKit

func twoSum(intArray:[Int], target:Int) -> [Int] {
    let indexArray = findIndexsForTwoSum(intArray, target:target)
    if indexArray.count == 0 {
        return []
    }
    let resultArray = formatResult(indexArray)
    return [resultArray[0],resultArray[1]]
}

// this is the bad way, O(n**2)
//func findIndexsForTwoSum(intArray:[Int], target:Int) -> [Int] {
//    var indexSum:Int
//    var indexArray = [0,1]
//    for i in 0..<intArray.count {
//        for j in i+1..<intArray.count {
//            indexSum = intArray[i] + intArray[j]
//            if (indexSum == target) {
//                indexArray = [i,j]
//                break
//            }
//        }
//    }
//    return indexArray;
//}

// this is the good way, check if array contains the combinations that add up to target, O(Cn)
func findIndexsForTwoSum(intArray:[Int], target:Int) -> [Int] {
    var targetMinusIndex:Int
    for i in 0..<intArray.count {
        targetMinusIndex = target-i
        if let index1 = intArray.indexOf(i) {
            if let index2 = intArray.indexOf(targetMinusIndex) {
                if index1 != index2 {
                    return [index1,index2]
                }
            }
        }
    }
    return []
}

func formatResult(indexArray:[Int]) -> [Int] {
    var indexArray = [indexArray[0],indexArray[1]]
    indexArray = indexArray.sort()
    return [indexArray[0]+1,indexArray[1]+1]
}

func testTwoSumArrayFaultyInput() {
    let inputArray = [7,2,1,5]
    let correctArray = []
    let resultArray = twoSum(inputArray, target:10)
    resultArray == correctArray
}

func testTwoSumArrayTarget7() {
    let inputArray = [7,2,1,5]
    let correctArray = [2,4]
    let resultArray = twoSum(inputArray, target:7)
    resultArray == correctArray
}

func testTwoSumArrayTarget6() {
    let inputArray = [0,2,4]
    let correctArray = [2,3]
    let resultArray = twoSum(inputArray, target:6)
    resultArray == correctArray
}

func testTwoSumArrayTarget4() {
    let inputArray = [0,2,4]
    let correctArray = [1,3]
    let resultArray = twoSum(inputArray, target:4)
    resultArray == correctArray
}

func testTwoSumArrayTarget2() {
    let inputArray = [0,2,4]
    let correctArray = [1,2]
    let resultArray = twoSum(inputArray, target:2)
    resultArray == correctArray
}

func testFormatResultInOrder() {
    let index1 = 1
    let index2 = 2
    let correctResult = [2,3]
    let result = formatResult([index1,index2])
    result == correctResult
}

func testFormatResultInOutOrder() {
    let index1 = 2
    let index2 = 1
    let correctResult = [2,3]
    let result = formatResult([index1,index2])
    result == correctResult
}

testFormatResultInOrder()
testFormatResultInOutOrder()
testTwoSumArrayTarget2()
testTwoSumArrayTarget4()
testTwoSumArrayTarget6()
testTwoSumArrayTarget7()
testTwoSumArrayFaultyInput()
