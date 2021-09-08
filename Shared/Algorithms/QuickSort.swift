//
//  QuickSort.swift
//  Structures
//
//  Created by Игорь Яськин on 07.09.2021.
//

import Foundation

func quickSortNaive<T: Comparable>(_ a: [T]) -> [T] {
    print(a)
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count / 2]
    print("pivot = \(pivot)")

    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter{ $0 > pivot }
    
    return quickSortNaive(less) + equal + quickSortNaive(greater)
}


func partitionLomuto<T: Comparable>(_ a: inout[T],
                                    low: Int,
                                    high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    a.swapAt(i, high)
    print("Pivot = \(a[i])")
    return i
}

func quicksortLomuto<T: Comparable>(_ a: inout [T],
                                    low: Int,
                                    high: Int) {
    if low < high {
        print(a[low..<high])
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}


func partitionHoare<T: Comparable>(_ a: inout [T],
                                   low: Int,
                                   high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            print("Pivot = \(a[j])")
            return j
        }
    }
}

func quickSortHoare<T: Comparable>(_ a: inout [T],
                                   low: Int,
                                   high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quickSortHoare(&a, low: low, high: p)
        quickSortHoare(&a, low: p + 1, high: high)
    }
}

func medianOfThree<T: Comparable>(_ a: inout [T],
                                  low: Int,
                                  high: Int) -> Int {
    let center = (low + high) / 2
    print("Pivots: \([a[low], a[center], a[high]])")
    if a[low] > a[center] {
        a.swapAt(low, center)
    }
    
    if a[low] > a[high] {
        a.swapAt(low, high)
    }
    
    if a[center] > a[high] {
        a.swapAt(center, high)
    }
    
    return center
}

func quickSortMedian<T: Comparable>(_ a: inout [T],
                                    low: Int,
                                    high: Int) {
    if low < high {
        let pivotIndex = medianOfThree(&a, low: low, high: high)
        print("pivot = \(a[pivotIndex])")
        a.swapAt(pivotIndex, high)
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}


func partitionDutchFlag<T: Comparable>(_ a: inout [T],
                                       low: Int,
                                       high: Int,
                                       pivotIndex: Int) -> (Int, Int){
    let pivot = a[pivotIndex]
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    print(a)
    return (smaller, larger)
}

func quicksortDutchFlag<T: Comparable>(_ a: inout [T],
                                       low: Int,
                                       high: Int) {
    if low < high {
        print("\n")
        print(a[low...high])

        let (middleFirst, middleLast) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: high)
        print("(\(middleFirst), \(middleLast))")

        quicksortDutchFlag(&a, low: low, high: middleFirst - 1)
        quicksortDutchFlag(&a, low: middleLast + 1, high: high)
    }
}
