//
//  TreeExample.swift
//  Structures
//
//  Created by Игорь Яськин on 26.08.2021.
//

import Foundation

class TreeExample {
    
     static func creatingTree() -> TreeNode<String> {
        let tree = TreeNode("Beverages")
        
        let hot = TreeNode("hot")
        let cold = TreeNode("cold")
        
        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let chocolate = TreeNode("cocoa")
        
        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")
        
        let soda = TreeNode("soda")
        let milk = TreeNode("milk")
        
        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")
        
        tree.add(hot)
        tree.add(cold)
        
        hot.add(tea)
        hot.add(coffee)
        hot.add(chocolate)
        
        cold.add(soda)
        cold.add(milk)
        
        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)
        
        soda.add(gingerAle)
        soda.add(bitterLemon)
        
        return tree
    }
    
    static func treeDepthFirst() {
        print("drink tree Depth First\n")
        let tree = creatingTree()
        tree.forEachDepthFirst { print($0.value) }
    }
    
    static func treeLevelOrder() {
        print("drink tree Level Order\n")
        let tree = creatingTree()
        tree.forEachLevelOrder { print($0.value) }
    }
    
    static func treeSearch() {
        print("tree Search\n")
        let tree = creatingTree()
        
        if let searchResult1 = tree.search("ginger ale") {
            print("Found node: \(searchResult1.value)")
        }
        
        if let searchResult2 = tree.search("Vodka") {
            print("Found node: \(searchResult2.value)")
        } else {
            print("Not found Vodka")
        }

    }

}
