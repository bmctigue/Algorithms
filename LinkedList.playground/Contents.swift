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
    func find(data: Int) -> Node?
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
    
    func find(data: Int) -> Node? {
        var node: Node? = head
        while node != nil {
            if (node == nil) {
                return nil
            } else if node?.data == data {
                return node
            }
            node = node!.nextNode
        }
        return nil
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

let node =  ListNode(data: 6)
let node2 = ListNode(data: 5)
let node3 = ListNode(data: 4)
let node4 = ListNode(data: 3)
let node5 = ListNode(data: 2)
let node6 = ListNode(data: 1)
var list = LinkedList()
list.insertHead(node: node)
list.insertHead(node: node2)
list.insertHead(node: node3)
list.insertHead(node: node4)
list.insertHead(node: node5)
list.insertHead(node: node6)
list.printList()
//var length = list.length()
//let findNode1 = list.find(node.data)?.data
//let findNode2 = list.find(node2.data)?.data
//list.deleteHead()
//list.printList()
//length = list.length()

// Reverse a linked list

func reverseLinkedList(list: LinkedList) -> LinkedList {
    if list.length() < 2 {
        return list
    }
    var list = list
    var currentNode: Node? = list.head
    var temp: Node? = currentNode?.nextNode
    currentNode?.nextNode = nil
    
    while temp != nil {
        list.head = temp
        list.head?.nextNode = currentNode
        currentNode = temp
        currentNode?.nextNode = list.head?.nextNode
        temp = temp?.nextNode
    }
    return list
}
//let reversedList = reverseLinkedList(list)
//reversedList.printList()

func findKthNodeFromEnd(k: Int, head: Node?) -> Node? {
    var count = 0
    var currentNode = head
    var kthNode: Node?
    
    while currentNode != nil {
        if count >= k {
            if kthNode == nil {
                kthNode = head
            } else {
                kthNode = kthNode?.nextNode
            }
        }
        currentNode = currentNode?.nextNode
        count += 1
    }
    return kthNode
}

var kthNode: Node?
for i in 0...7 {
    kthNode = findKthNodeFromEnd(k: i, head: list.head)
    if let node = kthNode {
        print(node.data)
    } else {
        print("it's nil")
    }
}

