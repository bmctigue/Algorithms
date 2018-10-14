import Foundation
import XCTest

class Node: Equatable {
    var id: String
    var distance: Int
    var neighbors: [Neighbor]
    
    init(_ id: String, distance: Int = Int.max, neighbors: [Neighbor] = []) {
        self.id = id
        self.distance = distance
        self.neighbors = neighbors
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Neighbor {
    var distance: Int
    var node: Node
}

func initializeGraph() -> [String:Node] {
    var nodes = [String:Node]()
    let nodeA = Node("A")
    let nodeB = Node("B")
    let nodeC = Node("C")
    let nodeD = Node("D")
    let nodeE = Node("E")
    
    nodeA.neighbors = [Neighbor(distance: 6, node: nodeB),
                       Neighbor(distance: 1, node: nodeD)]
    nodeB.neighbors = [Neighbor(distance: 6, node: nodeA),
                       Neighbor(distance: 2, node: nodeD),
                       Neighbor(distance: 2, node: nodeE),
                       Neighbor(distance: 5, node: nodeC)]
    nodeC.neighbors = [Neighbor(distance: 5, node: nodeB),
                       Neighbor(distance: 5, node: nodeE)]
    nodeD.neighbors = [Neighbor(distance: 1, node: nodeA),
                       Neighbor(distance: 2, node: nodeB),
                       Neighbor(distance: 1, node: nodeE)]
    nodeE.neighbors = [Neighbor(distance: 1, node: nodeD),
                       Neighbor(distance: 2, node: nodeB),
                       Neighbor(distance: 5, node: nodeC)]
    nodes[nodeA.id] = nodeA
    nodes[nodeB.id] = nodeB
    nodes[nodeC.id] = nodeC
    nodes[nodeD.id] = nodeD
    nodes[nodeE.id] = nodeE
    return nodes
}

class DijkstraShortestPath {
    
    var unvisited = [Node]()
    var visited = [Node]()
    var shortest = [String:Int]()
    var previous = [String:String]()
    var nodes:[String:Node]
    
    init(_ nodes:[String:Node]) {
        self.nodes = nodes
        unvisited = Array(nodes.values)
    }

    func unVisitedContainsNode(_ node: Node) -> Bool {
        if unvisited.index(where: { $0 == node }) != nil {
            return true
        }
        return false
    }
    
    func updateVisited(_ node: Node) {
        if unVisitedContainsNode(node) {
            unvisited.remove(at: unvisited.index { $0 == node }!)
            visited.append(node)
        }
    }

    func closestNeighbor(_ node: Node) -> Neighbor? {
        guard !node.neighbors.isEmpty else {
            return nil
        }
        
        var closestNeighbor: Neighbor?
        var shortestDistance = Int.max
        for neighbor in node.neighbors {
            if unVisitedContainsNode(neighbor.node) {
                let distance = node.distance + neighbor.distance
                shortestDistance = distance < shortestDistance ? distance : shortestDistance
                closestNeighbor = neighbor
            }
        }
        return closestNeighbor
    }
    
    func updateNeighbors(_ node: Node) {
        for neighbor in node.neighbors {
            let distance = node.distance + neighbor.distance
            if distance < neighbor.node.distance {
                neighbor.node.distance = distance
                shortest[neighbor.node.id] = distance
                previous[neighbor.node.id] = node.id
            }
        }
    }

    func shortestPath(startId:String) -> ([String:Int],[String:String]) {
        
        guard !startId.isEmpty, var node:Node = nodes[startId] else {
            return (shortest,previous)
        }
        
        node.distance = 0
        shortest[node.id] = 0
        previous[node.id] = ""
        while unvisited.count > 0 {
            updateVisited(node)
            updateNeighbors(node)
            if let neighbor = closestNeighbor(node) {
                node = neighbor.node
            }
        }
        let result = (shortest,previous)
        print(result)
        return result
    }
}

class ShortestDistanceTests: XCTestCase {
    
    func testShortestPath() {
        let nodes = initializeGraph()
        let shortest = DijkstraShortestPath(nodes)
        let result: ([String:Int],[String:String]) = shortest.shortestPath(startId: "A")
        XCTAssert(result == (["A": 0, "E": 2, "B": 3, "C": 7, "D": 1], ["A": "", "E": "D", "B": "D", "C": "E", "D": "A"]))
    }
}

ShortestDistanceTests.defaultTestSuite.run()
