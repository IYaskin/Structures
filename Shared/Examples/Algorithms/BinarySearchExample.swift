//
//  BinarySearchExample.swift
//  Structures
//
//  Created by Игорь Яськин on 01.09.2021.
//

import Foundation

class BinarySearchExample {
    static func findElement() {
        let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
        let search31 = array.firstIndex(of: 1)
        let binarySearch31 = array.binarySearch(for: 1)
        print("index(of:): \(String(describing: search31))")
        print("binarySearch(for:): \(String(describing: binarySearch31))")
    }
}
