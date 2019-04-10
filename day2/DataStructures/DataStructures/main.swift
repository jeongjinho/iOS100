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

//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//stack.push(4)
//stack.push(5)
//print(stack.pop())
//print(stack.currentElement)
//print(stack.isFull())
//print(stack.isEmpty())
//print(stack.peak())
//var stack2 = Stack<String>(3)
//stack2.push("a")
//stack2.push("b")
//stack2.push("c")
//print(stack2.currentElement)
//print(stack2.isEmpty())
//print(stack2.isFull())
//
//
//var myStack: Stack = [4,5,6,7]
//
//var myStackFromStack = Stack<Int>(myStack)
//
//myStackFromStack.push(55)
//myStack.push(70)
//
//print(myStackFromStack)
//print(myStack)
//
//for element in myStackFromStack {
//    print(element)
//}





//var queue = Queue<Int>()
//
//queue.enqueue(1)
//queue.enqueue(2)
//queue.enqueue(3)
//queue.enqueue(4)
//queue.enqueue(5)
//print(queue.dequeue())
//queue.capacity = 3
//print(queue.capacity)


var queue: Queue<Int> = [1,2,3,4,5]
var queue2 =  Queue<Int>(queue)

let q1x = queue.dequeue()
queue2.enqueue(55)
print(queue2)
for el in queue {
    print(el)
}

private struct Constants {
    fileprivate static let defaultBufferCapacity: Int = 16
}

struct RingBuffer<T>  {
    var data: [T] = []
    var front: Int = 0
    var rear: Int = 0
    var internalCount = 0
    private func isFull() -> Bool {
        return internalCount == data.capacity
    }
    
    private func isEmpty() -> Bool {
        return internalCount < 1
    }
    //enqueue
    public mutating func enqueue(_ element: T) {
        if isFull() {
            dequeue()
        }
        if data.endIndex < data.capacity {
            self.data.append(element)
        } else {
            data[rear] = element
        }
        rear = (rear + 1) & (data.capacity - 1)
        internalCount += 1
    }
    //dequeue
    public mutating func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        let el = self.data[front]
        front = (front + 1) & (self.data.capacity - 1)
        internalCount -= 1
        return el
    }
    //peek
    public func peek() -> T? {
        if isEmpty() {
            return nil
        }
        return self.data[front]
    }
    public init(_ count: Int) {
        var capacity = count
        if (capacity < 1) {
            capacity = Constants.defaultBufferCapacity
        }
        // 2의 보수
        // 입력값에 2의 보수취하고 그걸 입력값이랑 AND연산하면 2의 거듭인지 알려줌
        if capacity &  (~capacity + 1) != capacity {
            var b = 1
            while (b < capacity) {
                b = b << 1
            }
            capacity = b
        }
        data = [T]()
        data.reserveCapacity(capacity)
    }
    public init() {
        data = [T]()
        data.reserveCapacity(Constants.defaultBufferCapacity)
    }
}


func example(str: String) {
    
    var circBuffer = RingBuffer<Int>(4)
    circBuffer.enqueue(100)
    circBuffer.enqueue(200)
    circBuffer.enqueue(300)
    circBuffer.enqueue(400)
    circBuffer.enqueue(500)
    print(circBuffer)
    let x = circBuffer.dequeue()
    print(x, circBuffer)
    let y = circBuffer.dequeue()
    print(y, circBuffer)
    let z = circBuffer.peek()
    print(z, circBuffer)
    circBuffer.enqueue(600)
    print(circBuffer)
    circBuffer.enqueue(700)
    print(circBuffer)
    circBuffer.enqueue(800)
    print(circBuffer)
    let y2 = circBuffer.dequeue()
    print(y2, circBuffer)
    let y3 = circBuffer.dequeue()
    print(y3, circBuffer)
    let y4 = circBuffer.dequeue()
    print(y4, circBuffer)
    let y5 = circBuffer.dequeue()
    print(y5, circBuffer)
}


example(str: "Circular buffer")



func makeRemainer() {
    
    let divide = 4
    let pedivi = 4
    
    let remainer = divide & (pedivi - 1)
    print("%@를 %@로 나눈 몫은 %@, 나머지는 %@이다. \n",divide,pedivi,remainer)
}

makeRemainer()
