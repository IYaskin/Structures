//
//  TreeNode.swift
//  Structures
//
//  Created by Игорь Яськин on 26.08.2021.
//

import Foundation

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        children.append(child)
    }
    
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return "\(value)"
    }
}



extension TreeNode {
    func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueStack<TreeNode>()
//        print(queue)
        children.forEach{ queue.enqueue($0)}
//        print(queue)
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{ queue.enqueue($0)}
//            print(queue)
        }
    }
}

extension TreeNode where T: Equatable {
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
