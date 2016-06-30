import UIKit

var str: String = "this is a list to reverse"

var chars = Array(str.characters)

func reverseString(testString: String) -> String {
    var chars = Array(testString.characters)
    var lower:Int = 0
    var upper:Int = chars.count - 1
    var holder: Character
    
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

func reverseWordsInString(testString:String, delimiter:Character) -> String {
    let appendedString = testString + String(delimiter)
    var chars = Array(appendedString.characters)
    var subChars: Array<Character>
    var wordStart:Int = 0
    var prevChar: Character = " "
    var currentChar:Character
    var reversedWord:String
    
    for index in 0..<chars.count {
        currentChar = chars[index]
        if currentChar == delimiter {
            if prevChar != delimiter {
                reversedWord = reverseString(appendedString[appendedString.startIndex.advancedBy(wordStart)...appendedString.startIndex.advancedBy(index)])
                subChars = Array(reversedWord.characters)
                for subIndex in 0..<subChars.count {
                    chars[subIndex + wordStart] = subChars[subIndex]
                }
            }
        } else {
            if prevChar == delimiter {
                wordStart = index
            }
        }
        prevChar = currentChar
    }
    var reversedString = String(chars)
    reversedString = reversedString[reversedString.startIndex.successor()..<reversedString.endIndex]
    return reverseString(reversedString)
}

let delimiter: Character = " "
let result = reverseWordsInString(str, delimiter: delimiter)
print("\(result)")
