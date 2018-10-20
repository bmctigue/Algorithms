import Foundation

func permutations(arr: [Int]) -> [[Int]] {
    var results:[[Int]] = []
    results = permutations(arr: arr, n: arr.count-1, results: results)
    return results
}

func permutations(arr: [Int], n: Int, results: [[Int]]) -> [[Int]] {
    var results = results
    var arr = arr
    if n == 0 {
        results.append(arr)
        return results
    } else {
        results = permutations(arr: arr, n: n-1, results: results)
        for i in 0..<n {
            arr.swapAt(i,n)
            results = permutations(arr: arr, n: n-1, results: results)
            arr.swapAt(i,n)
        }
    }
    return results
}

let arr = [1,2]
//let arr = [1,2,3]
//let arr = [1,2,3,4]
//let arr = [1,5,3,4,2]
print(permutations(arr: arr))



