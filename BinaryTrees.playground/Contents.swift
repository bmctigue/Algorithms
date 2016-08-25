

protocol NodeProtocol {
    var data: Int { get }
    var leftNode: Node? { get set }
    var rightNode: Node? { get set }
    var deleted: Bool { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
}

class Node: NodeProtocol {
    var data: Int
    var leftNode: Node?
    var rightNode: Node?
    var deleted: Bool = false
    
    init(data: Int) {
        self.data = data
    }
    
    func find(data: Int) -> Node? {
        if self.data == data && deleted == false {
            return self
        }
        if leftNode != nil && leftNode?.data < data {
            return leftNode!.find(data)
        }
        if rightNode != nil {
            return rightNode!.find(data)
        }
        return nil
    }
    
    func insert(data: Int) {
        if data >= self.data {
            if rightNode == nil {
                rightNode = Node(data: data)
            } else {
                rightNode!.insert(data)
            }
        } else {
            if leftNode == nil {
                leftNode = Node(data: data)
            } else {
                leftNode!.insert(data)
            }
        }
    }
    
    func delete(data: Int) {
        let node = find(data)
        node?.deleted = true
    }
}

let node = Node(data: 5)
node.data

protocol BinaryTreeProtocol {
    var root: Node? { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
}

struct BinaryTree {
    var root: Node?
    
    init(root: Node?) {
        self.root = root
    }
    
    func find(data: Int) -> Node? {
        return root?.find(data)
    }
    
    func insert(data: Int) {
        root?.insert(data)
    }
    
    func delete(data: Int) {
        root?.delete(data)
    }
}

let tree = BinaryTree(root:node)
tree.root?.data

// find
var result = tree.find(5)
result?.data
result = tree.find(9)
result?.data

// insert
tree.insert(10)
result = tree.find(10)
result?.data

// delete
tree.delete(10)
result = tree.find(10)
result?.data


