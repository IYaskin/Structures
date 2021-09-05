//
//  SelectionSortExample.swift
//  Structures
//
//  Created by Игорь Яськин on 05.09.2021.
//

import Foundation

class SelectionSortingExample {
    
    static func test() {
        print("\nSelection Sort")
        
        var array = [1,8,6,5,3,4,2]
        print(array)
        print("\n")

        selectionSort(&array)
        print("Selection sorted: \(array)")
        
        print("\nGeneric Selection Sort")
        
        var array2 = [1,8,6,5,3,4,2]
        print(array2)
        print("\n")

        genericSelectionSort(&array2)
        print("Generic Selection sorted: \(array2)\n")

    }
}
