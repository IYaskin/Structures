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
    
    static func LinkedListCollection() {
        print("--- linked list collection ---")
        var list = LinkedList<Int>()
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
    
//    static func CopyOnWriteExample() {
//        print("--- copy-on-write example ---")
//
////        print("Array COW")
////        let array1 = [1, 2]
////        var array2 = array1
////
////        print("array1: \(array1)")
////        print("array2: \(array2)")
////        print("after adding 3 to array2")
////
////        array2.append(3)
////        print("array1: \(array1)")
////        print("array2: \(array2)")
////
////        print("--- --- --- --- --- --- --- --- ---")
//
//
//
//        print("LinkedList COW without copyNodes in functions")
//        var list1 = LinkedList<Int>()
//        list1.push(1)
////        list1.append(2)
////        list1.append(3)
////        list1.append(4)
//
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
//
//        var list2 = list1
//        var list3 = list1
//        print("List1: \(list1)")
//        print("List2: \(list2)")
//        print("List3: \(list3)")
//
////        print("List1: \(list1)")
////        print("List2: \(list2)")
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////        print("List2 uniquely referenced: \(isKnownUniquelyReferenced(&(list2.head)))")
//
//        //print("after adding 5 to List2")
//        //list2.append(5)
//        list2.push(2)
//        list3.push(3)
//
////        list3.pop()
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////        print("List2 uniquely referenced: \(isKnownUniquelyReferenced(&(list2.head)))")
//        print("List1: \(list1)")
//        print("List2: \(list2)")
//        print("List3: \(list3)")
//
//        list1.append(10)
//        list2.append(20)
//        list3.append(30)
//
////        list3.pop()
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////        print("List2 uniquely referenced: \(isKnownUniquelyReferenced(&(list2.head)))")
//        print("List1: \(list1)")
//        print("List2: \(list2)")
//        print("List3: \(list3)")
//
//
//        print("Unfortunately, your linked list does not have value semantics! This is because your underlying storage uses a reference type (Node). This is a serious problem, as LinkedList is a struct and therefore should use value semantics. Implementing COW will fix this problem.")
//        print("--- --- --- --- --- --- --- --- ---")
//
//
////        print("LinkedList COW")
////        var list1 = LinkedList<Int>()
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////        list1.append(1)
////        list1.append(2)
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////        var list2 = list1
////        print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&(list1.head)))")
////
////        print("List1: \(list1)")
////        print("List2: \(list2)")
////        print("after adding 3 to List2")
////        list2.append(3)
////        print("List1: \(list1)")
////        print("List2: \(list2)")
////        print("--- --- --- --- --- --- --- --- ---")
//
//
//    }

}
