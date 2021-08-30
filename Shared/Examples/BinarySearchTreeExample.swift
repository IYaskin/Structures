//
//  BinarySearchTreeExample.swift
//  Structures
//
//  Created by Игорь Яськин on 26.08.2021.
//

import Foundation

class BinarySearchTreeExample {
    
    static func createTree() {
        var bst = BinarySearchTree<Int>()
        for i in 0..<5 {
            bst.insert(i)
        }
        print(bst)
        print(exampleTree())
    }
    
    static func exampleTree() -> BinarySearchTree<Int> {
        var bst = BinarySearchTree<Int>()
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)
        bst.insert(0)
        bst.insert(2)
        bst.insert(5)
        return bst
    }
    
    static func findingNode() {
        print("TraverseInOrder")
        if exampleTree().contains(5) {
            print("Found 5")
        } else {
            print("Couldn't find 5")
        }
        
        print("\nCompare nodes")

        if exampleTree().betterContains(5) {
            print("Found 5")
        } else {
            print("Couldn't find 5")
        }

    }
    
    static func removingNode() {
        var tree = exampleTree()
        print("Removing a node")
        print("Tree before removal:")
        print(tree)
        tree.remove(3)
        print("Tree after removing root:")
        print(tree)
        
        var tree2 = exampleTree()
        tree2.remove(1)
        print("Tree if removing 1:")
        print(tree2)

    }

}
