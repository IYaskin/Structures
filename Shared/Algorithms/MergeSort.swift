//
//  MergeSort.swift
//  Structures
//
//  Created by Игорь Яськин on 06.09.2021.
//

import Foundation

//Рекурсивно делим массив пополам, и собираем его по сортированным кусочкам. Два массива сортируются в один и возвращаются.

func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    print("MergeSort: \(array)")
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    print("Merge : \(left) & \(right)")
    var leftIndex = 0
    var rightIndex = 0
    
    var result: [Element] = [] {
        didSet {
            print("Result*: \(result)")
        }
    }
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            print("1")
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            print("2")

            result.append(rightElement)
            rightIndex += 1
        } else {
            print("3")

            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        print("4")

        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        print("5")

        result.append(contentsOf: right[rightIndex...])
    }
    print("Result = \(result)")
    return result
}
