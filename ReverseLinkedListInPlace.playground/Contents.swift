import Foundation
import XCTest

class Node<T> {
    var value: T
    var next: Node?
    init(_ value: T, _ next: Node?) {
        self.value = value
        self.next = next
    }
}

class ReversedLinkedListInPlace {
    
    typealias T = Int
    
    private var head: Node<T>
    private let tail: Node<T>
    
    init(_ node: Node<T>) {
        self.head = node
        self.tail = head
    }
    
    func reverse() -> Node<T> {
        return reverseList(head: head, next: head.next)
    }
    
    private func reverseList<T>(head: Node<T>, next: Node<T>?) -> Node<T> {
        guard next != nil else {
            tail.next = nil
            return head
        }
        var head = head
        var next = next
        let previous = head
        head = next!
        next = head.next
        head.next = previous
        return reverseList(head: head, next: next)
    }
    
    func nodes<T>(_ node: Node<T>?) -> [T] {
        var nodes = [T]()
        
        guard var node = node else {
            return nodes
        }
        
        nodes.append(node.value)
        while node.next != nil {
            let nextNode = node.next!
            nodes.append(nextNode.value)
            node = nextNode
        }
        return nodes
    }
}

class TestReverseLinkedListInPlace: XCTestCase {
    
    func testReverseOneNode() {
        let node = Node(1, nil)
        let reversedLinkedList = ReversedLinkedListInPlace(node)
        var head = node
        let originalNodes = reversedLinkedList.nodes(head)
        head = reversedLinkedList.reverse()
        let reversedNodes = reversedLinkedList.nodes(head)
        XCTAssert(reversedNodes == originalNodes.reversed())
    }
    
    func testReverseNodes() {
        let node4 = Node(4, nil)
        let node3 = Node(3, node4)
        let node2 = Node(2, node3)
        let node1 = Node(1, node2)
        let reversedLinkedList = ReversedLinkedListInPlace(node1)
        var head = node1
        let originalNodes = reversedLinkedList.nodes(head)
        head = reversedLinkedList.reverse()
        let reversedNodes = reversedLinkedList.nodes(head)
        XCTAssert(reversedNodes == originalNodes.reversed())
    }
}

TestReverseLinkedListInPlace.defaultTestSuite.run()
