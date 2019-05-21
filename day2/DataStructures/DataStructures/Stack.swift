//
//  Stack.swift
//  DataStructures
//
//  Created by jeongjinho on 11/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation
public struct Stack<T> {
    private var elements: [T] = []
    var currentElement: [T] {
        return self.elements
    }
    var count: Int {
        return self.elements.count
    }
    init() {
        
    }
    init<S: Sequence>( _ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
    init(_ capacity: Int) {
        
        self.elements.reserveCapacity(capacity)
    }
    mutating func push( _ element: T) {
        
        self.elements.append(element)
        // print(self.elements.last)
    }
    @discardableResult
    mutating func pop() -> T? {
        let lastElement = self.elements.remove(at: count - 1)
        return lastElement
    }
    func isEmpty() -> Bool{
        return self.elements.count == 0 ? true : false
    }
    func isFull() -> Bool {
        if self.elements.capacity != 0 && self.elements.count >= self.elements.capacity {
            return true
        }
        return false
    }
    func peak() -> T? {
        return self.elements.last
    }
    
}


extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.elements.description
    }
    public var description: String {
        return self.elements.description
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

public struct ArrayIterator<T>: IteratorProtocol {
    
    
    var currentElement: [T]
    init(elements: [T]) {
        self.currentElement = elements
    }
    
    mutating public func next() -> T? {
        if (!self.currentElement.isEmpty) {
            return self.currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    //    public func makeIterator() -> ArrayIterator<T> {
    //        return ArrayIterator<T>(elements: self.elements)
    //    }
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
    }
}


struct Stack2<T> {
    private var elements: [T] = []
    
    init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
    
    var currentElements: [T]  {
        return self.elements
    }
    var count: Int {
        return self.elements.count
    }
    mutating func push( _ element: T) {
        
        self.elements.append(element)
        // print(self.elements.last)
    }
    mutating func pop() -> T? {
        let lastElement = self.elements.remove(at: count - 1)
        return lastElement
    }
    func isEmpty() -> Bool{
        return self.elements.count == 0 ? true : false
    }
    func isFull() -> Bool {
        if self.elements.capacity != 0 && self.elements.count >= self.elements.capacity {
            return true
        }
        return false
    }
    func peak() -> T? {
        return self.elements.last
    }
}

extension Stack2: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return self.elements.description
    }
    var debugDescription: String {
            return self.elements.description
    }
}

extension Stack2: ExpressibleByArrayLiteral {
   public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

public struct ArrayIterator2<T>: IteratorProtocol {
    public mutating func next() -> T? {
        if !self.currentElement.isEmpty {
            return self.currentElement.last
        }
        return nil
    }
    
    public typealias Element = T
    
    
    
    
    var currentElement: [T] = []
    
    init(elements: [T]) {
        self.currentElement = elements
    }

}

extension Stack2: Sequence {
    
    public func makeIterator() -> ArrayIterator2<T> {
        return ArrayIterator2(elements: self.elements)
    }
}
