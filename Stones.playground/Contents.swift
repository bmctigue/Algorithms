import Foundation

/*
    Trail of stones with numbers on them.
    Any 2 consecutive stones differ by 1 of 2 values.
    Find the value of the last stone.
*/

/*
    Constraints
    positive integers
    1 <= n,a,b <= 103
*/

/*
    Sample Input
    n = 2, a = 2, b = 3 -> 4,5,6
    n = 3, a = 1, b = 2 -> 2,3,4
    n = 4, a = 10, b = 100 -> 30,120,210,300
 
*/

/*
    Implementation Ideas
*/

/*
    Pseudo Code
*/

func stones(n: Int, a: Int, b: Int) -> [Int] {
    var results = [0]
    var resultsSet = Set<Int>()
    let differences = Array(Set<Int>([a,b]))
    let limit = n <= 2 && differences.count > 1 ? n : n - 1
    for _ in (1...limit) {
        resultsSet = Set<Int>()
        for tempResult in results {
            if differences.count == 1 {
                let temp = tempResult + differences.first!
                resultsSet.insert(temp)
            } else {
                for item1 in differences {
                    let temp = tempResult + item1
                    resultsSet.insert(temp)
                    for item2 in differences {
                        let temp = tempResult + item2
                        resultsSet.insert(temp)
                    }
                }
            }
        }
        
        results = Array(resultsSet).sorted()
    }
    return results
}


class CoderPadTests {
    
    func test1() -> Bool {
        let testStones = stones(n: 2, a: 2, b: 3)
        let result = testStones == [4,5,6]
        return result
    }

    func test2() -> Bool {
        let testStones = stones(n: 3, a: 1, b: 2)
        let result = testStones == [2,3,4]
        return result
    }

    func test3() -> Bool {
        let testStones = stones(n: 4, a: 10, b: 100)
        let result = testStones == [30,120,210,300]
        return result
    }
    
    func test4() -> Bool {
        let testStones = stones(n: 2, a: 1, b: 1)
        let result = testStones == [1]
        return result
    }
    
    func test5() -> Bool {
        let testStones = stones(n: 100, a: 1, b: 1)
        let result = testStones == [99]
        return result
    }
    
    func printResult(_ name: String, result: Bool) {
        let resultString = result ? "Passed" : "Failed"
        print("\(name): \(resultString)")
    }
    
    func run() {
        var result = test1()
        printResult("Test1", result: result)
        result = test2()
        printResult("Test2", result: result)
        result = test3()
        printResult("Test3", result: result)
        result = test4()
        printResult("Test4", result: result)
        result = test5()
        printResult("Test5", result: result)
    }
}

let test = CoderPadTests()
test.run()
