//
//  RadixSort.swift
//  Structures
//
//  Created by Игорь Яськин on 06.09.2021.
//

import Foundation
//Поразрадная сортировка. Создаем 10 корзинок, сначала сортируем корзины по единицам, потом по десяткам и тд. Цифры при сортировке по десяткам будут в нулевой корзине.

extension Array where Element == Int {
    
    public mutating func radixSort() {
        
        let base = 10
        var done = false
        var digits = 1
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            
            forEach { number in
                print("Number = \(number)")
                let remainingPart = number / digits
                print("remainingPart = \(remainingPart)")
                let digit = remainingPart % base
                print("digit = \(digit)")
                buckets[digit].append(number)
                print("Buckets: \(buckets)")
                if remainingPart > 0 {
                    done = false
                }
            }
            
            digits *= base
            self = buckets.flatMap{ $0 }
            print("self = \(self)\n")
        }
    }
}
