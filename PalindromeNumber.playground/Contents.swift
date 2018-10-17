import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let numString = String(x)
        return isPalindrome(s: numString)
    }

    func isPalindrome(s: String) -> Bool {
        if s.count < 2 {
            return true
        }
        let start = s.index(s.startIndex, offsetBy: 0)
        let end = s.index(s.endIndex, offsetBy: -1)
        if s[start] != s[end] {
            return false
        }
        if s.count > 2 {
            let subStart = s.index(s.startIndex, offsetBy: 1)
            let subEnd = s.index(s.endIndex, offsetBy: -2)
            let subString = String(s[subStart...subEnd])
            return isPalindrome(s: subString)
        }
        return true
    }
}

//let x = 121
//let x = -121
let x = 10
let solution = Solution()

//print(solution.isPalindrome(s: s))

print(solution.isPalindrome(x))
