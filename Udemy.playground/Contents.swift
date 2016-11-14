// Euclid find the greatest common denominator of 2 integers, m > n

func findGCD(m: Int, n:Int) -> Int {
    var result: Int
    let r = m % n
    if r == 0 {
        result = n
    } else {
        result = findGCD(m: n, n: r)
    }
    return result
}

findGCD(m: 2, n: 1)
findGCD(m: 4, n: 2)
findGCD(m: 20, n: 16)
findGCD(m: 15, n: 12)
findGCD(m: 100, n: 75)
