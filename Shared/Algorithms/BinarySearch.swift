//
//  BinarySearch.swift
//  Structures
//
//  Created by Игорь Яськин on 01.09.2021.
//

import Foundation
//Binary search is one of the most efficient searching algorithms with a time complexity of O(log n). This is comparable with searching for an element inside a balanced binary search tree.
//There are two conditions that need to be met before binary search may be used:
//The collection must be able to perform index manipulation in constant time. This means that the collection must be a RandomAccessCollection.
//The collection must be sorted.

extension RandomAccessCollection where Element: Comparable {
    
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        print(self[range])

        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        print(self[middle])

        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}


//Binary search is a powerful algorithm to learn and comes up often in programming interviews. Whenever you read something along the lines of “Given a sorted array...”, consider using the binary search algorithm. Also, if you are given a problem that looks like it is going to be O(n2) to search, consider doing some up-front sorting so you can use binary searching to reduce it down to the cost of the sort at O(n log n).
