//
//  StructuresApp.swift
//  Shared
//
//  Created by Игорь Яськин on 18.08.2021.
//

import SwiftUI

@main
struct StructuresApp: App {
    
    init() {
        // Node
        //LinkedListExample.creatingAndLinkingNodes()
        
        // LinkedList
        //LinkedListExample.LinkedListPush()
        //LinkedListExample.LinkedListAppend()
        //LinkedListExample.LinkedListInserting()
        //LinkedListExample.LinkedListPop()
        //LinkedListExample.LinkedListRemoveLast()
        //LinkedListExample.LinkedListRemovingAfter()
        //LinkedListExample.LinkedListCollection()
//        //LinkedListExample.CopyOnWriteExample()
        
        // DoublyLinkedList
//        DoublyLinkedListExample.LinkedListPush()
//        DoublyLinkedListExample.LinkedListAppend()
//        DoublyLinkedListExample.LinkedListInserting()
//        DoublyLinkedListExample.LinkedListPop()
//        DoublyLinkedListExample.LinkedListRemoveLast()
//        DoublyLinkedListExample.LinkedListRemovingAfter()
//        DoublyLinkedListExample.LinkedListCollection()
        
        //Stack
        //StackExample.usingStack()
        //StackExample.initStackFromArray()
        //StackExample.initStackFromArrayLiteral()
        
        //Queue
        QueueExample.queueArray()
        QueueExample.queueDoubleLinkedList()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}