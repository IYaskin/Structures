//
//  DoublyLinkedList.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation
// My experiment for queue(page 61)

class DoubleNode<Value> {
    var value: Value
    
    var prev: DoubleNode?
    var next: DoubleNode?
    
    init(value: Value,
         prev: DoubleNode? = nil,
         next: DoubleNode? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

extension DoubleNode: CustomStringConvertible {
    
    var description: String {
        guard let next = next else {
            return "\(value)(\(prev?.value))"
        }
        return "\(value)(\(prev?.value)) -> " + String(describing: next) + " "
    }
}


struct DoublyLinkedList<Value> {
    var head: DoubleNode<Value>?
    var tail: DoubleNode<Value>?
    
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push (_ value: Value) {
        let newHead = DoubleNode(value: value, prev: nil, next: head)
        head?.prev = newHead
        head = newHead
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append (_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = DoubleNode(value: value, prev: tail)
        tail = tail!.next
    }
    
    func node(at index: Int) -> DoubleNode<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value,
                         after node: DoubleNode<Value>) -> DoubleNode<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        let newNode = DoubleNode(value: value, prev: node, next: node.next)
        newNode.next?.prev = newNode
        node.next = newNode

        return node.next!
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            head?.prev = nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard head !== tail else {
            return pop()
        }

        guard let value = tail?.value,
              let prev = tail?.prev else {
            return nil
        }

        tail = prev
        tail?.next = nil
        return value
    }
    
    mutating func remove(after node: DoubleNode<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next?.next?.prev = node
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension DoublyLinkedList: Collection {
    
    struct Index: Comparable {
        
        var node: DoubleNode<Value>?
        
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
