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

diceRoll(roll1: 1, roll2: 2)
diceRoll(roll1: 2, roll2: 2)

//Numbers to Words
func numberToWord(number: Int) -> String {
    let names = ["too small", "one", "two", "three", "four", "too large"]
    if number < 1 {
        return names[0]
    } else if number > 4 {
        return names[5]
    } else {
        return names[number]
    }
}

numberToWord(number: 0)
numberToWord(number: 1)
numberToWord(number: 2)
numberToWord(number: 3)
numberToWord(number: 4)
numberToWord(number: 5)

// Pirate Ship

enum PirateShipState: Int {
    case Bad = 0
    case Good = 1
    case Great = 2
}

func pirateShip(gold: Int, pirates: Int) -> PirateShipState {
    if pirates == 0 {
        return .Good
    } else if gold < pirates || (gold + pirates) > 100 {
        return .Bad
    } else if gold % pirates == 0 {
        return .Great
    }
    return .Good
}

pirateShip(gold: 1, pirates:2)
pirateShip(gold: 60, pirates:51)
pirateShip(gold: 10, pirates:0)
pirateShip(gold: 0, pirates:0)
pirateShip(gold: 41, pirates:40)
pirateShip(gold: 20, pirates:20)

// Tip Calculator
func tipCalculator(amount: Int, rating: Int) -> Int {
    let percentMultiplier = 0.05
    let tip: Double = Double(amount) * (Double(rating) * percentMultiplier)
    return amount + Int(tip)
}
tipCalculator(amount: 100, rating: 1)
tipCalculator(amount: 100, rating: 2)
tipCalculator(amount: 100, rating: 3)
tipCalculator(amount: 100, rating: 4)
tipCalculator(amount: 100, rating: 5)

