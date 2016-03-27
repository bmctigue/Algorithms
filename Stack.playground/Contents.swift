// This implementation uses an array as the underlying data type. 

import UIKit

enum Dish {
    case Dinner
    case Salad
    case Bread
}

struct StackOfDishes {
    var dishes:[Dish] = []
    
    mutating func push(dish:Dish) {
        dishes.append(dish)
    }
    
    mutating func pop() -> Dish? {
        if (count() == 0) {
            return nil
        }
        return dishes.removeLast()
    }
    
    func count() -> Int {
        return dishes.count
    }
    
    mutating func clear() {
        var dish: Dish?
        repeat {
            dish = pop()
        } while dish != nil
    }
    
    func printStack() {
        for dish in dishes {
            print("\(dish)")
        }
    }
}

func testStack() {
    let dinnerDish = Dish.Dinner
    let saladDish = Dish.Salad
    let breadDish = Dish.Bread
    
    var stack = StackOfDishes()
    
    stack.clear()
    let testDish = stack.pop()
    assert(testDish == nil, "Dish popped from empty stack is not nil")
    print("Popping from empty stack returns nil")
    print("-------------")
    
    stack.clear()
    stack.push(dinnerDish)
    assert(stack.count() == 1, "Stack size is not 1")
    stack.printStack()
    print("-------------")
    
    stack.clear()
    stack.push(dinnerDish)
    stack.push(saladDish)
    stack.push(breadDish)
    if let dish = stack.pop() {
        assert(dish == breadDish)
        print("The popped dish is a bread dish")
    }
    assert(stack.count() == 2, "Stack size is not 2")
    stack.printStack()
    print("-------------")
    
    stack.clear()
    stack.push(dinnerDish)
    stack.push(saladDish)
    stack.push(breadDish)
    stack.clear()
    assert(stack.count() == 0, "Stack size is not 0")
    print("Stack is empty")
    print("-------------")
    
    stack.clear()
    stack.push(breadDish)
    assert(stack.count() == 1, "Stack size is not 1")
    stack.printStack()
}

func reverseArray(array:[Dish]) -> [Dish] {
    var result: [Dish] = []
    var stack = StackOfDishes()
    
    for dish in array {
        stack.push(dish)
    }
    
    var dish = stack.pop()
    while (dish != nil) {
        result.append(dish!)
        dish = stack.pop()
    }
    
    return result
}

func testReverseArrayWithEmptyArray() {
    let testArray: [Dish] = []
    print("testArray: \(testArray)")
    let resultArray = reverseArray(testArray)
    assert(resultArray == testArray.reverse(), "Reversing empty array didn't work")
    print("resultArray: \(resultArray)")
}

func testReverseArray() {
    let testArray = [Dish.Bread,Dish.Dinner,Dish.Salad]
    print("testArray: \(testArray)")
    let resultArray = reverseArray(testArray)
    assert(resultArray == testArray.reverse(), "Reversing non empty array didn't work")
    print("resultArray: \(resultArray)")
}

func runTests() {
    testStack()
    print("-------------")
    testReverseArrayWithEmptyArray()
    print("-------------")
    testReverseArray()
}

runTests()
