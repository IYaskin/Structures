//
//  Node.swift
//  Structures
//
//  Created by Игорь Яськин on 18.08.2021.
//

import Foundation

class Node<Int> {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
