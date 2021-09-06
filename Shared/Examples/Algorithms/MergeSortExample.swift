//
//  MergeSortExample.swift
//  Structures
//
//  Created by Игорь Яськин on 06.09.2021.
//

import Foundation

class MergeSortExample {
    
    static func test() {
        print("Merge Sorting")
        
        //let array = [7, 2, 6, 3, 9]
        let array = [10, 9 , 8, 7, 6, 5, 4, 3, 2, 1]

        print(array)
        print("\n")
        print("\nMerge Sorted: \(mergeSort(array))")
    }
}
