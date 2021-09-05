//
//  BubbleSorting.swift
//  Structures
//
//  Created by Игорь Яськин on 04.09.2021.
//

import Foundation

class BubbleSortingExample {
    
    static func test() {
        print("Bubble Sort")
        
        var array = [1,8,6,5,3,4,2]
        print(array)
        print("\n")

        bubbleSort(&array)
        print("Bubble sorted: \(array)")
        
        print("\nGeneric Bubble Sort")
        
        var array2 = [1,8,6,5,3,4,2]
        print(array2)
        print("\n")

        genericBubbleSort(&array2)
        print("Generic Bubble sorted: \(array2)\n")

    }
    
    
}
