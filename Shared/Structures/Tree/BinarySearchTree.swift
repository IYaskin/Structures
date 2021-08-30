//
//  BinarySearchTree.swift
//  Structures
//
//  Created by Игорь Яськин on 26.08.2021.
//

import Foundation

struct BinarySearchTree<Element: Comparable> {
    
    private(set) var root: BinaryNode<Element>?
    
    init() {}
    
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    func contains(_ value: Element) -> Bool {
        guard let root = root else {
            return false
        }
        var found = false
        root.traverseInOrder {
            print($0)
            if $0 == value {
                found = true
            }
        }
        return found
    }
    
    //In a balanced binary search tree, this implementation of contains is an O(log n) operation.
    func betterContains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            print(node.value)

            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.rightChild!.min.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        return root?.description ?? "empty tree"
    }
}
