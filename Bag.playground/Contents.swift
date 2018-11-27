import Foundation

class Item {
    var name: String = ""
    
    init(_ name: String) {
        self.name = name
    }
}

final class Bag: Item {
    var items = [Item]()
}

let item1 = Item("Item1")
let item2 = Item("Item2")
let item3 = Item("Item3")
let item4 = Item("Item4")
let item5 = Item("Item5")
let item6 = Item("Item6")
let item7 = Item("Item7")
let item8 = Item("Item8")

let bagOfHoldings2 = Bag("Bag of Holdings")
bagOfHoldings2.items = [item5,item6,item7]

let bagOfHoldings3 = Bag("Bag of Holdings")
bagOfHoldings3.items = [item1,item4,item8]


let bagOfHoldings = Bag("Bag of Holdings")
bagOfHoldings.items = [item1,item2,item3,bagOfHoldings2,item7,bagOfHoldings3]

func report() {
    var countHash = [String:Int]()
    countHash = processBag(bagOfHoldings, countHash: countHash)
    printReport(countHash: countHash)
}

func processBag(_ bag: Bag, countHash: [String:Int]) -> [String:Int] {
    var countHash = countHash
    countHash = updateHashWith(bag, countHash: countHash)
    
    guard !bag.items.isEmpty else {
        return countHash
    }
    
    for item in bag.items {
        if item is Bag {
            countHash = processBag(item as! Bag, countHash: countHash)
        } else {
            countHash = updateHashWith(item, countHash: countHash)
        }
    }
    return countHash
}

func updateHashWith(_ item: Item, countHash: [String:Int]) -> [String:Int] {
    var countHash = countHash
    if let count = countHash[item.name] {
        countHash[item.name] = count + 1
    } else {
        countHash[item.name] = 1
    }
    return countHash
}

func printReport(countHash: [String:Int]) {
    for key in countHash.keys.sorted() {
        print("name: \(key)")
        if let count = countHash[key] {
            print("count: \(count)")
        }
    }
}

report()
