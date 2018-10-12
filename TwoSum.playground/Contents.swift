import UIKit

func twoSum(intArray:[Int], target:Int) -> [Int] {
    if intArray.count < 2 {
        return []
    }
    let indexArray = findIndexsForTwoSum(intArray: intArray, target:target)
    if indexArray.count < 2 {
        return []
    }
    let resultArray = formatResult(indexArray: indexArray)
    return [resultArray[0], resultArray[1]]
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

// this is one way, check if array contains the combinations that add up to target, O(Cn), this one is good if target/2 > size of input array
//func findIndexsForTwoSum(intArray:[Int], target:Int) -> [Int] {
//    var targetMinusIndex:Int
//    for i in 0..<target {
//        targetMinusIndex = target-i
//        if  (i >= targetMinusIndex) {
//            printSeparator()
//            print ("no match")
//            break
//        }
//        print("i:\(i) targetMinusIndex:\(targetMinusIndex)")
//        if let index1 = intArray.indexOf(i) {
//            if let index2 = intArray.indexOf(targetMinusIndex) {
//                printSeparator()
//                return [index1,index2]
//            }
//        }
//    }
//    printSeparator()
//    return []
//}

// also good, create hash of values and return if correct partner found
func findIndexsForTwoSum(intArray:[Int], target:Int) -> [Int] {
    var targetPartner:Int
    var hashTable:[Int:Int] = [:]
    for i in 0..<intArray.count {
        hashTable[intArray[i]] = i
        targetPartner = target-intArray[i]
        print("i:\(i) targetPartner:\(targetPartner)")
        if let index2 = hashTable[targetPartner] {
            if i != index2 {
                printSeparator()
                return [i, index2]
            }
        }
    }
    printSeparator()
    print ("no match")
    printSeparator()
    return []
}

func formatResult(indexArray:[Int]) -> [Int] {
    var indexArray = [indexArray[0], indexArray[1]]
    indexArray = indexArray.sorted()
    return [indexArray[0]+1, indexArray[1]+1]
}

func printSeparator() {
    print ("============")
}

func testTwoSumArrayCenterCheckOdd() {
    let inputArray = [7, 2, 1, 3, 5]
    let correctArray: [Int] = []
    let resultArray = twoSum(intArray: inputArray, target:13)
    resultArray == correctArray
}

func testTwoSumArrayCenterCheckEven() {
    let inputArray = [7, 2, 1, 3, 6]
    let correctArray: [Int] = []
    let resultArray = twoSum(intArray: inputArray, target:12)
    resultArray == correctArray
}

func testTwoSumArrayFaultyInput() {
    let inputArray = [7, 2, 1, 5]
    let correctArray: [Int] = []
    let resultArray = twoSum(intArray: inputArray, target:10)
    resultArray == correctArray
}

func testTwoSumArrayTarget7() {
    let inputArray = [7, 2, 1, 5]
    let correctArray = [2, 4]
    let resultArray = twoSum(intArray: inputArray, target:7)
    resultArray == correctArray
}

func testTwoSumArrayTarget6() {
    let inputArray = [0, 2, 4]
    let correctArray = [2, 3]
    let resultArray = twoSum(intArray: inputArray, target:6)
    resultArray == correctArray
}

func testTwoSumArrayTarget4() {
    let inputArray = [0, 2, 4]
    let correctArray = [1, 3]
    let resultArray = twoSum(intArray: inputArray, target:4)
    resultArray == correctArray
}

func testTwoSumArrayTarget2() {
    let inputArray = [0, 2, 4]
    let correctArray = [1, 2]
    let resultArray = twoSum(intArray: inputArray, target:2)
    resultArray == correctArray
}

func testTwoSumArrayTarget2NoMatch() {
    let inputArray = [0, 1]
    let correctArray: [Int] = []
    let resultArray = twoSum(intArray: inputArray, target:2)
    resultArray == correctArray
}

func testTwoSumArrayTarget1() {
    let inputArray = [0, 1]
    let correctArray = [1, 2]
    let resultArray = twoSum(intArray: inputArray, target:1)
    resultArray == correctArray
}

func testTwoSumArraySize1() {
    let inputArray = [0]
    let correctArray: [Int] = []
    let resultArray = twoSum(intArray: inputArray, target:2)
    resultArray == correctArray
}

func testFormatResultInOrder() {
    let index1 = 1
    let index2 = 2
    let correctResult = [2, 3]
    let result = formatResult(indexArray: [index1, index2])
    result == correctResult
}

func testFormatResultInOutOrder() {
    let index1 = 2
    let index2 = 1
    let correctResult = [2, 3]
    let result = formatResult(indexArray: [index1, index2])
    result == correctResult
}

testFormatResultInOrder()
testFormatResultInOutOrder()
testTwoSumArraySize1()
testTwoSumArrayTarget1()
testTwoSumArrayTarget2()
testTwoSumArrayTarget2NoMatch()
testTwoSumArrayTarget4()
testTwoSumArrayTarget6()
testTwoSumArrayTarget7()
testTwoSumArrayFaultyInput()
testTwoSumArrayCenterCheckEven()
testTwoSumArrayCenterCheckOdd()
