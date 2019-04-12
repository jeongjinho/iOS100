//
//  main.swift
//  DataStructures
//
//  Created by jeongjinho on 01/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation

func example(str: String) {
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
}


func example1(str: String) {
    var queue: Queue<Int> = [1,2,3,4,5]
    var queue2 =  Queue<Int>(queue)
    
    let q1x = queue.dequeue()
    queue2.enqueue(55)
    print(queue2)
    for el in queue {
        print(el)
    }

}

func example2(str: String) {
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

example(str: "Stack")
example1(str: "Queue")
example2(str: "Circular buffer")

func makeRemainer() {
    
    let divide = 4
    let pedivi = 4
    
    let remainer = divide & (pedivi - 1)
    print("\(divide)를 \(pedivi)로 나눈 나머지는 \(remainer) 이다. \n")
}

func makeDivide(value: Int, divide) {

    
    
    //    let value = divider >> (divided/2)
//    print(value)
    
    
}

makeRemainer()
makeDivide()
