//
//  BinaryTreeExample.swift
//  Structures
//
//  Created by Игорь Яськин on 26.08.2021.
//

import Foundation

class BinaryTreeExample {
    
    static func createTree() -> BinaryNode<Int> {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        seven.leftChild = one
        seven.rightChild = nine
        
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        return seven
    }
    
    static func treeDiagram() {
        print(createTree())
    }
    
    static func inOrderTraversal() {
        print("In Order Traversal")
        createTree().traverseInOrder{ print($0) }
    }
    
    static func preOrderTraversal() {
        print("Pre Order Traversal")
        createTree().traversePreOrder{ print($0) }
    }

    static func postOrderTraversal() {
        print("Post Order Traversal")
        createTree().traversePostOrder{ print($0) }
    }

}
