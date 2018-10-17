import Foundation

func combinations(arr: [Int]) -> [[Int]] {
    let subArr: [Int] = []
    let results:[[Int]] = []
    return combinations(arr: arr, i: 0, subArr: subArr, results: results)
}

func combinations(arr: [Int], i: Int, subArr: [Int], results: [[Int]]) -> [[Int]] {
    var results = results
    if i == arr.count {
        results.append(subArr)
        return results
    }
    let included = subArr + [arr[i]]
    let includedResults = combinations(arr: arr, i: i+1, subArr: included, results: results)
    let excludedResults = combinations(arr: arr, i: i+1, subArr: subArr, results: results)
    return includedResults + excludedResults
}

//let arr = [1,2]
//let arr = [1,2,3]
let arr = [1,2,3,4]
//let arr = [1,5,3,4,2]
print(combinations(arr: arr))



