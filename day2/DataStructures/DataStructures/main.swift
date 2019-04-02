//
//  main.swift
//  DataStructures
//
//  Created by jeongjinho on 01/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation

print("Hello, World!")



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

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
print(stack.pop())
print(stack.currentElement)
print(stack.isFull())
print(stack.isEmpty())
print(stack.peak())
var stack2 = Stack<String>(3)
stack2.push("a")
stack2.push("b")
stack2.push("c")
print(stack2.currentElement)
print(stack2.isEmpty())
print(stack2.isFull())


var myStack: Stack = [4,5,6,7]

var myStackFromStack = Stack<Int>(myStack)

myStackFromStack.push(55)
myStack.push(70)

print(myStackFromStack)
print(myStack)

for element in myStackFromStack {
    print(element)
}

//
//struct Lotto: RandomNumberGenerator {
//    var seed: Int = Int.max
//    mutating func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger {
//        let range = Range(
//        return T.random(in: Range(, using: &<#T##RandomNumberGenerator#>)
//    }
//}
//
//
//
//
//var loTTo = Lotto(seed: 0)
//print(loTTo.next())
print(myStackFromStack.currentElement.randomElement())


