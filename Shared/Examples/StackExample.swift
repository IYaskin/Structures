//
//  StackExample.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation

class StackExample {
    
    static func usingStack() {
        print("using a stack")
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        
        print(stack)
        
        print("pop = \(stack.pop())")
        print(stack)
    }
    
    static func initStackFromArray() {
        print("initializing a stack from an array")
        let array = ["A", "B", "C", "D"]
        var stack = Stack(array)
        print(stack)
    }

    static func initStackFromArrayLiteral() {
        print("initializing a stack from an array literal")
        var stack: Stack = [1.0, 2.0, 3.0, 4.0]
        print(stack)
        print("pop = \(stack.pop())")
        print(stack)
    }

}
