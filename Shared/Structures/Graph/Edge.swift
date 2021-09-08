//
//  Edge.swift
//  Structures
//
//  Created by Игорь Яськин on 08.09.2021.
//

import Foundation

enum EdgeType {
    case directed
    case undirected
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}
