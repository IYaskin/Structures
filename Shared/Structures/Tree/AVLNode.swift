//
//  AVLTree.swift
//  Structures
//
//  Created by Игорь Яськин on 31.08.2021.
//

import Foundation

class AVLNode<Element> {
    var value: Element
    var leftChild: AVLNode?
    var rightChild: AVLNode?
    
    init(value: Element) {
        self.value = value
    }
    
    var min: AVLNode {
        return leftChild?.min ?? self
    }
    
    var height = 0

}

extension AVLNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }

}


extension AVLNode {
    
    var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    var leftHeight: Int {
        leftChild?.height ?? -1
    }
    
    var rightHeight: Int {
        return rightChild?.height ?? -1
    }

}

extension AVLNode: CustomStringConvertible {

  public var description: String {
    diagram(for: self)
  }
  
  private func diagram(for node: AVLNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
         + root + "\(node.value)\n"
         + diagram(for: node.leftChild,
                   bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
