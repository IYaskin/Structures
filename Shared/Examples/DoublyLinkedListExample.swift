//
//  DoublyLinkedListExample.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

class DoublyLinkedListExample {
    
    // Node
    static func creatingAndLinkingNodes() {
        print("--- creating and linking nodes ---")
        let node1 = DoubleNode(value: 1)
        let node2 = DoubleNode(value: 2)
        let node3 = DoubleNode(value: 3)
        
        node1.next = node2
        node2.next = node3
        print(node1)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    // Linked List
    static func LinkedListPush() {
        print("--- linked list push ---")
        var list = DoublyLinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListAppend() {
        print("--- linked list append ---")
        var list = DoublyLinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)

        print(list)
        print("--- --- --- --- --- --- --- --- ---")
    }
    
    static func LinkedListInserting() {
        print("--- linked list insert ---")
        var list = DoublyLinkedList<Int>()
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
        var list = DoublyLinkedList<Int>()
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
        var list = DoublyLinkedList<Int>()
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
        var list = DoublyLinkedList<Int>()
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
    
    static func LinkedListCollection() {
        print("--- linked list collection ---")
        var list = DoublyLinkedList<Int>()
        for i in 0...9 {
            list.append(i)
        }

        print(list)
        print("First: \(list[list.startIndex])")
        print("First 3: \(Array(list.prefix(3)))")
        print("Last 3: \(Array(list.suffix(3)))")

        let sum = list.reduce(0, +)
        print("Sum: \(sum)")
        print("--- --- --- --- --- --- --- --- ---")

    }
}
