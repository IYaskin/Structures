//
//  LinkedList.swift
//  Structures
//
//  Created by Игорь Яськин on 18.08.2021.
//

import Foundation
//A linked list is a collection of values arranged in a linear unidirectional sequence. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array:
//Constant time insertion and removal from the front of the list. Reliable performance characteristics.
//Linked list is a chain of nodes. Nodes have two responsibilities:
//1. Hold a value.
//2. Hold a reference to the next node. A nil value represents the end of the list.

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push (_ value: Value) {
//        copyNodes можно не использовать
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append (_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
//        copyNodes()
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value,
                         after node: Node<Value>) -> Node<Value> {
//        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    mutating func pop() -> Value? {
//        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
//        copyNodes()
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var previousNode = head
        var currentNode = head
        
        while let next = currentNode.next {
            previousNode = currentNode
            currentNode = next
        }
        
        previousNode.next = nil
        tail = previousNode
        return currentNode.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
//        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    
    struct Index: Comparable {
        
        var node: Node<Value>?
        
        static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node}
        }

    }
    
    var startIndex: Index {
        return Index(node: head)
    }
    
    var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    subscript(position: Index) -> Value {
        return position.node!.value
    }
}

// COW
//extension LinkedList {
//    private mutating func copyNodes() {
//        // дергается copynodes, когда head и tail одно тоже
////        var headEqualTail = false
////        if head === tail {
////            headEqualTail = true
////            tail = nil
////        }
//        
//        guard !isKnownUniquelyReferenced(&head) else {
////            if headEqualTail {
////                tail = head
////            }
//            return
//        }
//
////        if headEqualTail {
////            tail = head
////        }
//
//        guard var oldNode = head else {
//            return
//        }
//
//
//
//        print("copyNodes()")
//
//        head = Node(value: oldNode.value)
//        var newNode = head
//
//        while let nextOldNode = oldNode.next {
//            newNode!.next = Node(value: nextOldNode.value)
//            newNode = newNode!.next
//
//            oldNode = nextOldNode
//        }
//
//        tail = newNode
//    }
//
//}
