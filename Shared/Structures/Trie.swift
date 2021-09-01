//
//  TrieNode.swift
//  Structures
//
//  Created by Игорь Яськин on 01.09.2021.
//

import Foundation

class TrieNode<Key: Hashable> {
    var key: Key?
    
    weak var parent: TrieNode?
    
    var children: [Key: TrieNode] = [:]
    
    public var isTerminating = false
    
    init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}

class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    
    typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    init(){}
    
    func insert(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        
        current.isTerminating = true
    }
    
    func contains(_ collection: CollectionType) -> Bool {
        
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    func remove(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        
        guard current.isTerminating else {
            return
        }
        
        current.isTerminating = false
        
        while let parent = current.parent,
              current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
}

extension Trie where CollectionType:RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        
        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType] {
        var results: [CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var pref = prefix
            pref.append(child.key!)
            results.append(contentsOf: collections(startingWith: pref,
                                                   after: child))
        }
        return results
    }
}
