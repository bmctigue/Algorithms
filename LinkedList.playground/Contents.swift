//: Playground - noun: a place where people can play

import Foundation

protocol Node {
    var data: Int { get set }
    var nextNode: Node? { get set }
    init(data: Int)
}

struct ListNode: Node {
    var data: Int
    var nextNode: Node?
    init(data: Int) {
        self.data = data
    }
}

protocol Linked {
    var head: Node? { get set }
    mutating func insertHead(node: Node)
    mutating func deleteHead()
    func length() -> Int
    func printList()
}

struct LinkedList: Linked {
    var head: Node?
    
    mutating func insertHead(node: Node) {
        var node = node
        if let head = self.head {
            node.nextNode = head
        }
        self.head = node
    }
    
    mutating func deleteHead() {
        self.head = self.head?.nextNode
    }
    
    func length() -> Int {
        var length = 0
        var node: Node? = head
        if (node == nil) {
            return 0
        }
        while node != nil {
            length += 1
            node = node!.nextNode
        }
        return length
    }
    
    func printList() {
        var node: Node? = head
        var nodeList: String = "["
        while node != nil {
            nodeList += "\(node!.data)"
            node = node!.nextNode
            if (node != nil) {
               nodeList += ", "
            }
        }
        nodeList += "]"
        print(nodeList)
    }
}

let node = ListNode(data: 5)
let node2 = ListNode(data: 2)
var list = LinkedList()
list.insertHead(node)
list.insertHead(node2)
list.printList()
var length = list.length()
list.deleteHead()
list.printList()
length = list.length()
