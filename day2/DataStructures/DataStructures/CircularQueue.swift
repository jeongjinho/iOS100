//
//  CircularQueue.swift
//  DataStructures
//
//  Created by jeongjinho on 11/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation


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


extension RingBuffer: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return data.description
    }
    var debugDescription: String {
        return data.debugDescription
    }
}
