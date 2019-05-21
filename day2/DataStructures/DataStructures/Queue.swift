//
//  Queue.swift
//  DataStructures
//
//  Created by jeongjinho on 03/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation


public struct Queue2<T> {
    private var elements: [T] = []
    public var capicty: Int {
        get {
            return self.elements.capacity
        }
        set {
            self.elements.reserveCapacity(newValue)
        }
    }
    public var count: Int {
        get {
            return self.elements.count
        }
    }
    
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        self.elements.append(contentsOf: elements)
    }
    
    public mutating func enqueue(_ element: T) {
        
        self.elements.append(element)
    }
    public mutating func dequeue() -> T? {
        if self.elements.indices.contains(0) {
            return self.elements.remove(at: 0)
        }
        return nil
    }
    public func peek() -> T? {
        return self.elements.first
    }
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    public mutating func clear() {
        self.elements.removeAll()
    }
    
}

extension Queue2: CustomStringConvertible {
    public var description: String {
        get {
            return self.elements.description
        }
    }
}

extension Queue2: CustomDebugStringConvertible {
    public var debugDescription: String {
        get {
            return self.elements.debugDescription
        }
    }
}


extension Queue2: Sequence {
    public func makeIterator() -> QueueEterator<T> {
        return QueueEterator<T>.init(elements: self.elements)
    }
}


extension Queue2: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

public struct QueueEterator<T>: IteratorProtocol {
    public typealias Element = T
    
    var currentElements: [T] = []

    public init(elements: [T]) {
        self.currentElements = elements
    }
    public mutating func next() -> T? {
        if (!self.currentElements.isEmpty) {
            return self.currentElements[0]
        }
        return nil;
    }

}

public struct Queue<T> {
    private var elements: [T] = []
    //MARK - Coputed Property
    public var capacity: Int {
        get {
            return self.elements.capacity
        }
        set {
            self.elements.reserveCapacity(newValue)
        }
    }
    public var count: Int {
        get {
            return self.elements.count
        }
    }
    //MARK - initial
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        self.elements.append(contentsOf: elements)
    }
    //MARK - action
    public mutating func enqueue(_ element: T) {
        
        self.elements.append(element)
    }
    public mutating func dequeue() -> T? {
        if self.elements.indices.contains(0) {
            return self.elements.remove(at: 0)
        }
        return nil
    }
    public func peek() -> T? {
        return self.elements.first
    }
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    public mutating func clear() {
        self.elements.removeAll()
    }
}

extension Queue: Sequence {
    
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: elements.lazy))
    }
}

extension Queue: CustomStringConvertible , CustomDebugStringConvertible {
    public var description: String {
        return elements.description
    }
    
    public var debugDescription: String {
        return elements.debugDescription
    }
}

extension Queue: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}
