//
//  QuickSortExample.swift
//  Structures
//
//  Created by Игорь Яськин on 07.09.2021.
//

import Foundation

class QuickSortExample {
    
    static func test() {
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        print("Quick Sort")
        print(array)

        print("\nNaive")
        print(quickSortNaive(array))
        
        print("\nLomuto")
        print(array)
        quicksortLomuto(&array, low: 0, high: array.count - 1)
        print(array)
        
        print("\nHoare")

        var array2 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        quickSortHoare(&array2, low: 0, high: array2.count - 1)
        print(array2)
        
        print("\nMedian + Lomuto")

        var array3 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        print(array3)
        quickSortMedian(&array3, low: 0, high: array3.count - 1)
        print(array3)
        
        print("\nDutchFlag")

        var array4 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        print(array4)
        quicksortDutchFlag(&array4, low: 0, high: array4.count - 1)
        print(array4)


    }
}
