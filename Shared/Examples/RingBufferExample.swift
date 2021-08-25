//
//  RingBufferExample.swift
//  Structures
//
//  Created by Игорь Яськин on 25.08.2021.
//

import Foundation

class RingBufferExample {
    
    static func ringBuffer() {
        var ringBuffer = RingBuffer<Int>(count: 4)
        print("Writing")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        ringBuffer.write(1)
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        ringBuffer.write(2)
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        ringBuffer.write(3)
        print(ringBuffer)
        ringBuffer.write(4)
        print(ringBuffer)
        ringBuffer.write(5)
        print(ringBuffer)
        ringBuffer.write(6)
        print(ringBuffer)
        
        print("Reading")
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("peek = \(ringBuffer.peek())")

        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)

        print("Writing")
        print(ringBuffer)
        ringBuffer.write(10)
        print(ringBuffer)
        ringBuffer.write(20)
        print(ringBuffer)
        ringBuffer.write(30)
        print(ringBuffer)

        print("\n\n")
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")

        ringBuffer.write(40)
        print(ringBuffer)
        ringBuffer.write(50)
        print(ringBuffer)
        ringBuffer.write(60)
        print(ringBuffer)
        
        print("Reading")
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        print("read = " + "\(ringBuffer.read())")
        print(ringBuffer)
        

    }
    
    
    
}
