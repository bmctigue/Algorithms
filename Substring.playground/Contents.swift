//: Playground - noun: a place where people can play

import UIKit

// Determine if a string contains a substring and return the index if found

// should return 12
//let test1 = "World Wide Web"
//let substring = "Web"

// should return 0
//let test1 = "World Wide Web"
//let substring = "World Wide Web"

// should return -1
//let test1 = "World Wide Web"
//let substring = "Test"

func findSubString(testString: String, subString: String) -> Int {
    let testChars = testString.map({ String($0) })
    let subChars = subString.map({ String($0) })
    if testChars.count == 0 || subChars.count == 0 || subChars.count > testChars.count {
        return -1
    }
    if testString == subString {
        return 0
    }
    
    var resultIndex = -1
    for index in 0..<testChars.count {
        for subIndex in 0..<subChars.count {
            if testChars[index + subIndex] == subChars[subIndex] {
                if subIndex == subChars.count - 1 {
                   resultIndex = index
                }
            } else {
                break
            }
        }
        if resultIndex != -1 {
            break
        }
    }
    return resultIndex
}

// initial condition checks
findSubString(testString: "", subString: "Web")
findSubString(testString: "We", subString: "")
findSubString(testString: "", subString: "")
findSubString(testString: "We", subString: "Web")
findSubString(testString: "Web", subString: "Web")

// simplest case where substring is 1 char
findSubString(testString: "Web", subString: "c")
findSubString(testString: "We", subString: "W")
findSubString(testString: "We", subString: "e")
findSubString(testString: "Web", subString: "b")

findSubString(testString: "World Wide Web", subString: "Test")
findSubString(testString: "World Wide Web", subString: "World")
findSubString(testString: "World Wide Web", subString: "Wide")
findSubString(testString: "World Wide Web", subString: "Web")
findSubString(testString: "World Wide Web", subString: "eb")
