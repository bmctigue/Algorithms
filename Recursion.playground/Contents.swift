// Tower of Hanoi

var a: [Int] = []
var b: [Int] = []
var c: [Int] = []

let d1 = 1
let d2 = 2
let d3 = 3
let d4 = 4

a.append(d4)
a.append(d3)
a.append(d2)
a.append(d1)

func move(n: Int, from: String, to: String, working: String) -> (a: [Int], c: [Int], b: [Int]) {
    if n > 0 {
        if n == 1 {
            print("Moving final disc 1 from \(from) to \(to)")
            (a,c,b) = moveDisk(from: from, to:to, a: a, c: c, b: b)
        } else {
            move(n: n-1, from:from, to:working, working:to)
            print("Moving disc \(n) from \(from) to \(to)")
            (a,c,b) = moveDisk(from: from, to:to, a: a, c: c, b: b)
            move(n: n-1, from:working, to:to, working:from)
        }
    }
    return (a,c,b)
}

func moveDisk(from: String, to: String, a: [Int], c: [Int], b: [Int]) -> (a: [Int], c: [Int], b: [Int]) {
    var a = a
    var b = b
    var c = c
    switch from {
    case "A":
        switch to {
        case "B":
            b.append(a.removeLast())
        case "C":
            c.append(a.removeLast())
        default:break
        }
    case "B":
        switch to {
        case "A":
            a.append(b.removeLast())
        case "C":
            c.append(b.removeLast())
        default:break
        }
    case "C":
        switch to {
        case "A":
            a.append(c.removeLast())
        case "B":
            b.append(c.removeLast())
        default:break
        }
    default:break
    }
    return (a,c,b)
}
print(a,c,b)
(a,c,b) = move(n: a.count,from:"A", to:"C", working:"B")
print(a,c,b)
