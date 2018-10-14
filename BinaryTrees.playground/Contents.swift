protocol NodeProtocol {
    var data: Int { get }
    var leftNode: Node? { get set }
    var rightNode: Node? { get set }
    var deleted: Bool { get set }
    var nodeHeight: Int { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
    func height() -> Int
}

class Node: NodeProtocol {
    var data: Int
    var leftNode: Node?
    var rightNode: Node?
    var deleted: Bool = false
    var nodeHeight: Int = -1
    
    init(data: Int) {
        self.data = data
    }
    
    func find(data: Int) -> Node? {
        if self.data == data && deleted == false {
            return self
        }
        if leftNode != nil && (leftNode?.data)! < data {
            return leftNode!.find(data: data)
        }
        if rightNode != nil {
            return rightNode!.find(data: data)
        }
        return nil
    }
    
    func insert(data: Int) {
        if data >= self.data {
            if rightNode == nil {
                rightNode = Node(data: data)
            } else {
                rightNode!.insert(data: data)
            }
        } else {
            if leftNode == nil {
                leftNode = Node(data: data)
            } else {
                leftNode!.insert(data: data)
            }
        }
    }
    
    func delete(data: Int) {
        let node = find(data: data)
        node?.deleted = true
    }
    
    func height() -> Int {
        var leftHeight: Int = -1
        var rightHeight: Int = -1
        print("leftNode:\(String(describing: leftNode?.data))")
        print("rightNode:\(String(describing: rightNode?.data))")
        if leftNode != nil {
            leftHeight = leftNode!.height()
            print("leftHeight:\(leftHeight)")
        }
        if rightNode != nil {
            rightHeight = rightNode!.height()
            print("rightHeight:\(rightHeight)")
        }
        self.nodeHeight = max(leftHeight, rightHeight) + 1
        print("data: \(self.data), height:\(self.nodeHeight)")
        return self.nodeHeight
    }
}

let node = Node(data: 5)
node.data

protocol BinaryTreeProtocol {
    var root: Node? { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
    func height(node: Node?)
}

struct BinaryTree {
    var root: Node?
    
    init(root: Node?) {
        self.root = root
    }
    
    func find(data: Int) -> Node? {
        return root?.find(data: data)
    }
    
    func insert(data: Int) {
        root?.insert(data: data)
    }
    
    func delete(data: Int) {
        root?.delete(data: data)
    }
    
    func height() -> Int {
        return (root?.height())!
    }
}

let tree = BinaryTree(root:node)
tree.root?.data

// find
var result = tree.find(data: 5)
result?.data
result = tree.find(data: 9)
result?.data

tree.insert(data: 9)
result?.data

// insert
tree.insert(data: 10)
result = tree.find(data: 10)
result?.data

// height
tree.height()

// delete
tree.delete(data: 10)
result = tree.find(data: 10)
result?.data

