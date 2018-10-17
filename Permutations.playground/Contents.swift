import Foundation

func permutations(arr: [Int]) -> [[Int]] {
    var results:[[Int]] = []
    results = permutations(arr: arr, start: 0, results: results)
    return results
}

func permutations(arr: [Int], start: Int, results: [[Int]]) -> [[Int]] {
    var results = results
    if start == arr.count-1 {
        results.append(arr)
        return results
    }
    for i in start..<arr.count {
        let temp = start == i ? arr :  swap(arr: arr, i: start, j: i)
        results = permutations(arr: temp, start: start+1, results: results)
    }
    return results
}

func swap(arr: [Int], i: Int, j: Int) -> [Int] {
    var arr = arr
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
    return arr
}

//let arr = [1,2]
let arr = [1,2,3]
//let arr = [1,2,3,4]
//let arr = [1,5,3,4,2]
print(permutations(arr: arr))



