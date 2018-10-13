import UIKit

var str: String = "this is a list to reverse"

var chars = Array(str.characters)

func reverseString(testString: String) -> String {
    var chars = Array(testString.characters)
    var lower:Int = 0
    var upper:Int = chars.count - 1
    var holder: Character
//    print("\(chars)")
    if chars.count < 2 {
        return testString
    }
    
    while lower < upper {
        holder = chars[upper]
        chars[upper] = chars[lower]
        chars[lower] = holder
        lower += 1
        upper -= 1
    }
    return String(chars)
}

//print("\(reverseString(str))")

str = "My name is X Y Z"
//str = "a b c d e f"
//str = "abcdef"

func reverseWordsInString(testString:String, delimiter:Character) -> String {
    let appendedString = String(delimiter) + testString + String(delimiter)
    var chars = Array(appendedString.characters)
    var wordStart:Int = 0
    var prevChar: Character = " "
    var currentChar:Character
    
    for index in 0..<chars.count {
        currentChar = chars[index]
        if currentChar == delimiter {
            if prevChar != delimiter && (index - wordStart) > 1 {
                chars = updateCharsWithReversedWord(chars: chars, appendedString: appendedString, wordStart: wordStart, index: index)
            }
        } else {
            if prevChar == delimiter {
                wordStart = index
            }
        }
        prevChar = currentChar
    }
    var reversedString = String(chars)
    reversedString = reversedString[reversedString.index(reversedString.startIndex, offsetBy: 1)..<reversedString.index(reversedString.endIndex, offsetBy: -1)]
    return reverseString(testString: reversedString)
}

func updateCharsWithReversedWord(chars:Array<Character>, appendedString:String, wordStart:Int, index:Int) -> Array<Character> {
    var newChars = chars
    let reversedWord = reverseString(testString: appendedString[appendedString.index(appendedString.startIndex, offsetBy: wordStart)...appendedString.index(appendedString.startIndex, offsetBy: index-1)])
    let subChars = Array(reversedWord.characters)
    for subIndex in 0..<subChars.count {
        newChars[subIndex + wordStart] = subChars[subIndex]
    }
    return newChars
}

let delimiter: Character = " "
let result = reverseWordsInString(testString: str, delimiter: delimiter)
print("\(result)")

