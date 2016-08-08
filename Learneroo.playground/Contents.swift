//: Playground - noun: a place where people can play

import UIKit

// Dice Roll
func diceRoll(roll1: Int, roll2: Int) -> Int {
    let sum = roll1 + roll2
    if roll1 == roll2 {
        return 2 * sum
    }
    return sum
}

diceRoll(1, roll2: 2)
diceRoll(2, roll2: 2)

//Numbers to Words
func numberToWord(number: Int) -> String {
    let names = ["too small","one","two","three","four","too large"]
    if number < 1 {
        return names[0]
    } else if number > 4 {
        return names[5]
    } else {
        return names[number]
    }
}

numberToWord(0)
numberToWord(1)
numberToWord(2)
numberToWord(3)
numberToWord(4)
numberToWord(5)

// Pirate Ship

enum PirateShipState: Int {
    case Bad = 0
    case Good = 1
    case Great = 2
}

func pirateShip(gold: Int, pirates: Int) -> PirateShipState {
    if pirates == 0 {
        return .Good
    } else if gold < pirates || (gold + pirates) > 100  {
        return .Bad
    } else if gold % pirates == 0 {
        return .Great
    }
    return .Good
}

pirateShip(1,pirates:2)
pirateShip(60,pirates:51)
pirateShip(10,pirates:0)
pirateShip(0,pirates:0)
pirateShip(41,pirates:40)
pirateShip(20,pirates:20)

// Tip Calculator
func tipCalculator(amount: Int, rating: Int) -> Int {
    let percentMultiplier = 0.05
    let tip: Double = Double(amount) * (Double(rating) * percentMultiplier)
    return amount + Int(tip)
}
tipCalculator(100, rating: 1)
tipCalculator(100, rating: 2)
tipCalculator(100, rating: 3)
tipCalculator(100, rating: 4)
tipCalculator(100, rating: 5)

