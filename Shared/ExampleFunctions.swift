//
//  ExampleFunctions.swift
//  Structures
//
//  Created by Игорь Яськин on 18.08.2021.
//

import Foundation

class ExampleFunctions {
    
    // Node
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
    
    // Linked List
    static func LinkedListPush() {
        print("--- linked list push ---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListAppend() {
        print("--- linked list append ---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListInserting() {
        print("--- linked list insert ---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        var middleNode = list.node(at: 1)!
        print("insert 5678 after the middle")
        for number in 5...8 {
            //list.insert(number, after: middleNode)
            
            //перезаписываем middleNode вставленным узлом
            middleNode = list.insert(number, after: middleNode)
        }
        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }

    static func LinkedListPop() {
        print("--- linked list pop ---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        print("pop = \(list.pop()!)")
        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListRemoveLast() {
        print("--- linked list removeLast ---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        print("pop = \(list.removeLast())")
        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }


    static func LinkedListRemovingAfter() {
        print("--- linked list removing after ---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        var firstNode = list.node(at: 0)!
        //var middleNode = list.node(at: 1)!
        print("remove after 0")
        list.remove(after: firstNode)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }

}
