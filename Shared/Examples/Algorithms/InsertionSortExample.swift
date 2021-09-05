//
//  InsertionSortExample.swift
//  Structures
//
//  Created by Игорь Яськин on 05.09.2021.
//

import Foundation

class InsertionSortingExample {
    
    static func test() {
        print("\nInsertion Sort")
        
        var array = [1,8,6,5,3,4,2]
        print(array)
        print("\n")

        insertionSort(&array)
        print("Insertion sorted: \(array)")
        
        print("\nGeneric Insertion Sort")
        
        var array2 = [1,8,6,5,3,4,2]
        print(array2)
        print("\n")

        genericInsertionSort(&array2)
        print("Generic Insertion sorted: \(array2)\n")

    }
}
