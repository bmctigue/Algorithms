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

//class FizzBuzz {
//    func check(number: Int) -> String {
//        switch (number % 3, number % 5) {
//        case (0, 0):
//            return "FizzBuzz!"
//        case (0, _):
//            return "Fizz!"
//        case (_, 0):
//            return "Buzz!"
//        case (_, _):
//            return "\(number)"
//        }
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
            let result: String? = evaluateNumber(i: i, xDivisor: xDivisor, yDivisor: yDivisor)
            printResult(i: i, result: result)
        }
    }
    
    private func evaluateNumber(i: Int, xDivisor: Int, yDivisor: Int) -> String? {
        let divisibleByX = i % xDivisor == 0
        let divisibleByY = i % yDivisor == 0
        
        switch (divisibleByX,divisibleByY) {
        case (true,true):
            return(ResultString.XY.rawValue)
        case (true,false):
            return(ResultString.X.rawValue)
        case (false,true):
            return(ResultString.Y.rawValue)
        default:
            return nil
        }
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



