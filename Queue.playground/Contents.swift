//: Playground - noun: a place where people can play

import UIKit

enum Dish {
    case Dinner
    case Salad
    case Bread
}

struct QueueOfDishes {
    var dishes:[Dish?] = []
    var head = 0
    
    var isEmpty: Bool {
        return self.count() == 0
    }
    
    func count() -> Int {
        return dishes.count - head
    }
    
    mutating func enqueue(dish:Dish) {
        dishes.append(dish)
    }
    
    mutating func dequeue() -> Dish? {
        if (self.isEmpty) {
            return nil
        }
        let dish = dishes[head]
        dishes[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(dishes.count)
        if dishes.count > 50 && percentage > 0.25 {
            dishes.removeFirst(head)
            head = 0
        }
        
        return dish
    }
    
    mutating func clear() {
        dishes = []
        head = 0
    }
    
    func printQueue() {
        for dish in dishes {
            print("\(dish)")
        }
    }
    
    func printHead() {
        print("head: \(head)")
    }
    
    func printData() {
        print("----Data-----")
        self.printHead()
        self.printQueue()
        print("-------------")
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
    queue.printData()
    
    queue.clear()
    queue.enqueue(dinnerDish)
    queue.enqueue(saladDish)
    queue.enqueue(breadDish)
    queue.printData()
    if let dish = queue.dequeue() {
        assert(dish == dinnerDish)
        print("The dequeued dish is a dinner dish")
    }
    assert(queue.count() == 2, "queue size is not 2")
    queue.printData()

    queue.clear()
    queue.enqueue(dinnerDish)
    queue.enqueue(saladDish)
    queue.enqueue(breadDish)
    queue.clear()
    assert(queue.count() == 0, "queue size is not 0")
    print("queue is empty")
    print("-------------")
    
    queue.clear()
    queue.enqueue(dinnerDish)
    queue.enqueue(saladDish)
    queue.enqueue(breadDish)
    queue.enqueue(dinnerDish)
    queue.printData()
    if let dish1 = queue.dequeue() {
        assert(dish1 == dinnerDish)
        print("The dequeued dish is a dinner dish")
    }
    queue.printData()
    if let dish2 = queue.dequeue() {
        assert(dish2 == saladDish)
        print("The dequeued dish is a salad dish")
    }
    queue.printData()
    if let dish3 = queue.dequeue() {
        assert(dish3 == breadDish)
        print("The dequeued dish is a bread dish")
    }
    queue.printData()
    if let dish4 = queue.dequeue() {
        assert(dish4 == dinnerDish)
        print("The dequeued dish is a dinner dish")
    }
    queue.printData()
    print("queue.count: \(queue.count())")
    assert(queue.count() == 0, "queue size is not 0")
    assert(queue.isEmpty,"The queue is not empty")
    print("-------------")
    
    queue.clear()
    queue.enqueue(breadDish)
    assert(queue.count() == 1, "queue size is not 1")
    queue.printQueue()
}

testQueue()
