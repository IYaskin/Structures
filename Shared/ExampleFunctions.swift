//
//  ExampleFunctions.swift
//  Structures
//
//  Created by Игорь Яськин on 18.08.2021.
//

import Foundation

class ExampleFunctions {
    
    static func creatingAndLinkingNodes() {
        print("--- creating and linking nodes ---")
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        print(node1)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListPush() {
        print("--- linked list push ---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
}
