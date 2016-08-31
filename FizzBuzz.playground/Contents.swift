//: Playground - noun: a place where people can play

import UIKit

//"Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”."

//for i in 1...100 {
//    if i % 15 == 0 {
//        print("FizzBuzz")
//    } else if i % 3 == 0 {
//        print("Fizz")
//    } else if i % 5 == 0 {
//        print("Buzz")
//    } else {
//        print("\(i)")
//    }
//}

protocol FizzBuzz {
    var lower: Int { get }
    var upper: Int { get }
    var x: Int { get }
    var y: Int { get }
    func runFizzBuzz()
    func fizzBuzzString(divisibleByX: Bool, divisibleByY: Bool) -> String?
}

struct MyFizzBuzz: FizzBuzz {
    
    private(set) var lower: Int
    private(set) var upper: Int
    private(set) var x: Int
    private(set) var y: Int
    
    init(lower: Int, upper: Int, x: Int, y: Int) {
        self.lower = lower
        self.upper = upper
        self.x = x
        self.y = y
    }
    
    func runFizzBuzz() {
        if (upper <= lower) {
            print("illegal lower and upper values")
            return
        }
        for i in lower...upper {
            fizzBuzzForValues(i, x: x, y: y)
        }
    }
    
    func fizzBuzzForValues(i: Int, x: Int, y: Int) {
        let result: String? = evaluateFizzBuzz(i, x: x, y: y)
        if result != nil {
            print(result!)
        } else {
            print("\(i)")
        }
    }
    
    func evaluateFizzBuzz(i: Int, x: Int, y: Int) -> String? {
        let divisibleByX = i % x == 0
        let divisibleByY = i % y == 0
        return fizzBuzzString(divisibleByX, divisibleByY: divisibleByY)
    }
    
    func fizzBuzzString(divisibleByX: Bool, divisibleByY: Bool) -> String? {
        if divisibleByX && divisibleByY {
            return(FizzBuzzValue.FizzBuzz.rawValue)
        } else if divisibleByX {
            return(FizzBuzzValue.Fizz.rawValue)
        } else if divisibleByY {
            return(FizzBuzzValue.Buzz.rawValue)
        }
        return nil
    }
    
    enum FizzBuzzValue: String {
        case Fizz = "Fizz"
        case Buzz = "Buzz"
        case FizzBuzz = "FizzBuzz"
    }
}

let myFizzBuzz = MyFizzBuzz.init(lower: 1, upper: 100, x: 3, y: 5)
myFizzBuzz.runFizzBuzz()



