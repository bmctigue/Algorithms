import UIKit

protocol FindProtocol {
    func find(target:Int) -> [Int]
}

protocol IndexsForHash {
    func findIndexs(intArray:[Int], target:Int) -> [Int]
    func printSeparator()
}

protocol IndexsForTarget {
    func findIndexs(intArray:[Int], target:Int) -> [Int]
    func printSeparator()
}

struct FindDataStructureFromHash: FindProtocol, IndexsForHash {
    var valueArray = Array<Int>()
    
    mutating func addValue(value:Int) {
        if (!valueArray.contains(value)) {
            valueArray.append(value)
        }
    }
    
    func find(target:Int) -> [Int] {
        if valueArray.count < 2 {
            return []
        }
        let resultArray = findIndexs(intArray: valueArray, target:target)
        if resultArray.count < 2 {
            return []
        }
        return [resultArray[0], resultArray[1]]
    }
}

struct FindDataStructureFromTarget: FindProtocol, IndexsForTarget {
    var valueArray = Array<Int>()
    
    mutating func addValue(value:Int) {
        if (!valueArray.contains(value)) {
            valueArray.append(value)
        }
    }
    
    func find(target:Int) -> [Int] {
        if valueArray.count < 2 {
            return []
        }
        let resultArray = findIndexs(intArray: valueArray, target:target)
        if resultArray.count < 2 {
            return []
        }
        return [resultArray[0], resultArray[1]]
    }
}

extension IndexsForHash {
    func findIndexs(intArray:[Int], target:Int) -> [Int] {
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
    
    func printSeparator() {
        print ("############")
    }
}

extension IndexsForTarget {
    func findIndexs(intArray:[Int], target:Int) -> [Int] {
        var targetMinusIndex:Int
        for i in 0..<target {
            targetMinusIndex = target-i
            if  (i >= targetMinusIndex) {
                printSeparator()
                print ("no match")
                break
            }
            print("i:\(i) targetMinusIndex:\(targetMinusIndex)")
            if let index1 = intArray.index(of: i) {
                if let index2 = intArray.index(of: targetMinusIndex) {
                    printSeparator()
                    return [index1, index2]
                }
            }
        }
        printSeparator()
        return []
    }
    
    func printSeparator() {
        print ("************")
    }

}

func testFindArrayTarget7FromHash() {
    var findDataStruct = FindDataStructureFromHash()
    findDataStruct.addValue(value: 7)
    findDataStruct.addValue(value: 2)
    findDataStruct.addValue(value: 1)
    findDataStruct.addValue(value: 5)
    let correctArray = [1, 3]
    let resultArray = findDataStruct.find(target: 7).sorted()
    resultArray == correctArray
}

func testFindArrayTarget7FromTarget() {
    var findDataStruct = FindDataStructureFromTarget()
    findDataStruct.addValue(value: 7)
    findDataStruct.addValue(value: 2)
    findDataStruct.addValue(value: 1)
    findDataStruct.addValue(value: 5)
    let correctArray = [1, 3]
    let resultArray = findDataStruct.find(target: 7).sorted()
    resultArray == correctArray
}

testFindArrayTarget7FromHash()
testFindArrayTarget7FromTarget()

