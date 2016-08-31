//: FizzBuzz

//"Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”."

//for i in 1...100 {
//    if i % (3 * 5) == 0 {
//        print("FizzBuzz")
//    } else if i % 3 == 0 {
//        print("Fizz")
//    } else if i % 5 == 0 {
//        print("Buzz")
//    } else {
//        print("\(i)")
//    }
//}

struct FizzBuzz {
    
    private(set) var lowerLimit: Int
    private(set) var upperLimit: Int
    private(set) var xDivisor: Int
    private(set) var yDivisor: Int
    
    private enum ResultString: String {
        case X = "Fizz"
        case Y = "Buzz"
        case XY = "FizzBuzz"
    }
    
    init(lowerLimit: Int, upperLimit: Int, xDivisor: Int, yDivisor: Int) {
        self.lowerLimit = lowerLimit
        self.upperLimit = upperLimit
        self.xDivisor = xDivisor
        self.yDivisor = yDivisor
    }
    
    func run() {
        if lowerLimit < 0 || upperLimit < 0 || upperLimit <= lowerLimit {
            print("illegal lowerLimit/upperLimit values!")
            return
        }
        for i in lowerLimit...upperLimit {
            let result: String? = evaluateNumber(i, xDivisor: xDivisor, yDivisor: yDivisor)
            printResult(i, result: result)
        }
    }
    
    private func evaluateNumber(i: Int, xDivisor: Int, yDivisor: Int) -> String? {
        let divisibleByX = i % xDivisor == 0
        let divisibleByY = i % yDivisor == 0
        
        if divisibleByX && divisibleByY {
            return(ResultString.XY.rawValue)
        } else if divisibleByX {
            return(ResultString.X.rawValue)
        } else if divisibleByY {
            return(ResultString.Y.rawValue)
        }
        return nil
    }
    
    private func printResult(i: Int, result: String?) {
        if result != nil {
            print(result!)
        } else {
            print("\(i)")
        }
    }
    
}

let fizzBuzz = FizzBuzz.init(lowerLimit: 1, upperLimit: 100, xDivisor: 3, yDivisor: 5)
fizzBuzz.run()



