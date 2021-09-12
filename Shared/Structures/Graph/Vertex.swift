//
//  Vertex.swift
//  Structures
//
//  Created by Игорь Яськин on 08.09.2021.
//

import Foundation

struct Vertex<T> {
    let index: Int
    let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        //return "\(index): \(data)"
        return "\(data)"
    }
}
