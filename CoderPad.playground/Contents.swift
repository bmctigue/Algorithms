import Foundation

/*
    Problem Description
*/

/*
    Constraints
*/

/*
    Sample Input
*/

/*
    Pseudo Code
*/


class CoderPadTests {
    
    func setup() {
        print("setup")
    }
    
    func tearDown() {
        print("tearDown")
    }
    
    func testFunc() -> Bool {
        setup()
        let result = false
        tearDown()
        return result
    }
    
    func printResult(_ name: String, result: Bool) {
        let resultString = result ? "Passed" : "Failed"
        print("\(name): \(resultString)")
    }
    
    func run() {
        let result = testFunc()
        printResult("TestFunc", result: result)
    }
}

let test = CoderPadTests()
test.run()
