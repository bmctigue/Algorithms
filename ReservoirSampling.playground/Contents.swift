//: Playground - noun: a place where people can play

import UIKit

// create an array of 1000 random characters
func randomAlphaNumericArray(length: Int) -> [Character] {
    
    let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let allowedCharsCount = UInt32(allowedChars.characters.count)
    var randomArray: [Character] = []
    
    for _ in (0..<length) {
        let randomNum = Int(arc4random_uniform(allowedCharsCount))
        let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
        randomArray.append(newCharacter)
    }
    
    return randomArray
}

func randomNumber(range: Range<Int>) -> Int {
    let min = range.startIndex
    let max = range.endIndex
    return Int(arc4random_uniform(UInt32(max - min))) + min
}

func sampleSource(sourceArray:[Character]) -> [Character] {
    var reservoir: [Character] = []
    let reservoirSize = 10
    
    // fill the reservoir
    for i in 0..<reservoirSize {
        reservoir.append(sourceArray[i])
    }
    
    for totalCount in reservoirSize..<sourceArray.count {
        let j = randomNumber(0...totalCount)
        if j < reservoirSize {
            reservoir[j] = sourceArray[totalCount]
        }
    }

    return reservoir
}

let sourceArray = randomAlphaNumericArray(1000)
let sampleArray = sampleSource(sourceArray)
