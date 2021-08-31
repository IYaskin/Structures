//
//  AVLTreeExample.swift
//  Structures
//
//  Created by Игорь Яськин on 31.08.2021.
//

import Foundation

class AVLTreeExample {
    
    static func balancedInsert() {
        var tree = AVLTree<Int>()
        for i in 0..<7 {
            tree.insert(i)
        }
        print(tree)
    }
    
    static func removingValue() {
          var tree = AVLTree<Int>()
          tree.insert(15)
          tree.insert(10)
          tree.insert(16)
          tree.insert(18)
          print(tree)
          tree.remove(10)
          print(tree)
        
        var tree2 = AVLTree<Int>()
        for i in 0..<15 {
            tree2.insert(i)
        }
        print(tree2)
        tree2.remove(11)
        tree2.remove(3)
        tree2.remove(9)
        print(tree2)

    }
}
