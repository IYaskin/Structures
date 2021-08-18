//
//  LinkedList.swift
//  Structures
//
//  Created by Игорь Яськин on 18.08.2021.
//

import Foundation

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push (_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
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
