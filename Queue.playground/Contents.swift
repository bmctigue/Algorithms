//: Playground - noun: a place where people can play

import UIKit

enum Dish {
    case Dinner
    case Salad
    case Bread
}

struct QueueOfDishes {
    var dishes:[Dish] = []
    
    mutating func enqueue(dish:Dish) {
        dishes.append(dish)
    }
    
    mutating func dequeue() -> Dish? {
        if (count() == 0) {
            return nil
        }
        return dishes.removeFirst()
    }
    
    func count() -> Int {
        return dishes.count
    }
    
    mutating func clear() {
        var dish: Dish?
        repeat {
            dish = dequeue()
        } while dish != nil
    }
    
    func printQueue() {
        for dish in dishes {
            print("\(dish)")
        }
    }
}

func testQueue() {
    let dinnerDish = Dish.Dinner
    let saladDish = Dish.Salad
    let breadDish = Dish.Bread
    
    var queue = QueueOfDishes()
    
    queue.clear()
    let testDish = queue.dequeue()
    assert(testDish == nil, "Dish dequeued from empty queue is not nil")
    print("Dequeueing from empty queue returns nil")
    print("-------------")
    
    queue.clear()
    queue.enqueue(dinnerDish)
    assert(queue.count() == 1, "queue size is not 1")
    queue.printQueue()
    print("-------------")
    
    queue.clear()
    queue.enqueue(dinnerDish)
    queue.enqueue(saladDish)
    queue.enqueue(breadDish)
    if let dish = queue.dequeue() {
        assert(dish == dinnerDish)
        print("The dequeued dish is a dinner dish")
    }
    assert(queue.count() == 2, "queue size is not 2")
    queue.printQueue()
    print("-------------")
    
    queue.clear()
    queue.enqueue(dinnerDish)
    queue.enqueue(saladDish)
    queue.enqueue(breadDish)
    queue.clear()
    assert(queue.count() == 0, "queue size is not 0")
    print("queue is empty")
    print("-------------")
    
    queue.clear()
    queue.enqueue(breadDish)
    assert(queue.count() == 1, "queue size is not 1")
    queue.printQueue()
}

testQueue()
