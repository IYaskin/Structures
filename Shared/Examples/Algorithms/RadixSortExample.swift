//
//  RadixSortExample.swift
//  Structures
//
//  Created by Игорь Яськин on 06.09.2021.
//

import Foundation

class RadixSortExample {
    
    static func test() {
        print("Radix sort")
        //var array = [88, 410, 1772, 20]
        var array = [999, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

        print("Original array: \(array)")
        array.radixSort()
        print("Radix sorted: \(array)")
    }
}
