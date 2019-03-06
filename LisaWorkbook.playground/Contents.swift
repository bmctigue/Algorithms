import Foundation

/*
    Lisa has a math workbook. Problems are grouped into chapters. A problem is special if its index
    in the chapter is same as the page number.
*/

/*
    Chapters are 1 to n
    i chapter has arr[i] problems, number from 1 to arr[i]
    page has k problems
    last page can have fewer than i problems
    chapters start on a new page
    page indexing starts at 1
*/

/*
    Sample Input
    n = 5, k = 3, arr[4,2,6,1,10] -> 4
*/

/*
    Implementation Ideas
    problemIndex to track the problem we are on, problem index resets to 1 for each chapter
    at end of chapter, PageIndex += 1
    pageIndex to track the page we are on, pageIndex = pageIndex + (problemIndex % k)
    increment the count if problemIndex = pageIndex
*/

/*
    Pseudo Code
*/

func workbook(n: Int, k: Int, arr: [Int]) -> Int {
    var specialProblemsCount = 0
    var page = 1
    
    for problemCount in arr {
        for problem in (1...problemCount) {
            if problem == page {
                specialProblemsCount += 1
            }
            if problem % k == 0 || problem == problemCount {
                page += 1
            }
        }
    }
    return specialProblemsCount
}


class CoderPadTests {
    
    func testSpecialProblems() -> Bool {
        let result = workbook(n: 5, k: 3, arr: [4,2,6,1,10]) == 4
        return result
    }
    
    func printResult(_ name: String, result: Bool) {
        let resultString = result ? "Passed" : "Failed"
        print("\(name): \(resultString)")
    }
    
    func run() {
        let result = testSpecialProblems()
        printResult("SpecialProblems", result: result)
    }
}

let test = CoderPadTests()
test.run()
