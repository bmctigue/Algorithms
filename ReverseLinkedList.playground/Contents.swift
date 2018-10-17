import Foundation

class Node: NSObject {
    var data: Int = 0
    var next: Node?
    
    init(data: Int, next: Node?) {
        super.init()
        self.data = data
        self.next = next
    }
}

let node3 = Node(data: 3, next: nil)
let node2 = Node(data: 2, next: node3)
let node1 = Node.init(data: 1, next: node2)
let node0 = Node.init(data: 0, next: node1)
var head: Node?
head = node0

func reverseLinkedList(head: Node?) {
    reverse(node: head, previous: nil)
}

func reverse(node: Node?, previous: Node?) {
    guard let node = node else {
        head = previous
        return
    }
    reverse(node: node.next, previous: node)
    node.next = previous
}

func printList(node: Node?) -> [Int] {
    var node = node
    var results: [Int] = []
    while node != nil {
        results.append(node!.data)
        node = node!.next
    }
    return results
}

print(printList(node: head))
reverseLinkedList(head: head)
print(printList(node: head))

