//
//  PriorityQueue.swift
//  DataStructures
//
//  Created by jeongjinho on 02/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation
public struct PriorityQueue<T: Comparable> {
    
    fileprivate var heap = [T]()
    private let ordered: (T,T) -> Bool
    public init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending {
            ordered = { $0 > $1}
        } else {
            ordered = { $0 < $1}
        }
        heap = startingValues
        var i = heap.count / 2 - 1
        while i >= 0 {
            sink(i)
            i -= 1
        }
    }
    public var count: Int  { return heap.count }
    public var isEmpty: Bool { return heap.isEmpty }
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    public mutating func pop() -> T? {
        if heap.isEmpty  {return nil}
        if heap.count == 1 {return heap.removeFirst()}
        
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        sink(0)
        return temp
    }
    
    public mutating func remove(_ item: T) {
        if let index = heap.index(of: item) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            swim(index)
            sink(index)
        }
    }
    public mutating func removeAll(_ item: T) {
        var lastCount = heap.count
        remove(item)
        while heap.count < lastCount {
            lastCount = heap.count
            remove(item)
        }
    }
    public func peek() -> T? {
        return heap.first
    }
    public mutating func clear() {
        #if swift(>=3.0)
        heap.removeAll(keepingCapacity: false)
        #else
         heap.removeAll(keepCapacity: false)
        #endif
    }
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1
            if j < (heap.count - 1) && ordered(heap[j],heap[j+1]) { j += 1}
            if !ordered(heap[index], heap[j]) {break}
            heap.swapAt(index, j)
            index = j
        }
    }
    private mutating func swim(_ index: Int) {
        var index = index
        
        while index > 0 && ordered(heap[(index - 1) / 2],heap[index]) {
            
            heap.swapAt((index - 1) / 2, index)
                index = (index - 1) / 2
            }
        }
}
