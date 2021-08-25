//
//  RingBuffer.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation

struct RingBuffer<T> {
    private var array: [T?] = []
    private var readIndex = 0
    private var writeIndex = 0
    
    init(count: Int) {
        array = Array(repeating: nil, count: count)
    }
    
    private var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    private var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    var isFull: Bool {
        return availableSpaceForWriting == 0
    }

    
    mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        guard !isEmpty else {
            return nil
        }
        return array[readIndex % array.count]
    }
}

extension RingBuffer: CustomStringConvertible {
    var description: String {
        return array.map { $0 != nil ? "\($0!)" : "_" }
            .joined(separator: "-")
    }
}

