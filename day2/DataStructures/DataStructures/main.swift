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
func isEvenNumber(_ value: Int) -> Bool {
    let opt: Int? = nil
    let opt2: Int? = .none
    print(opt)
    print(opt2)
    return value & 1 == 0 ? true : false
}

makeRemainer()

print(isEvenNumber(4))

//public class ThermometerClass {
//    private(set) var temperature: Double = 0.0
//    public func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//let thermometerClass = ThermometerClass()
//thermometerClass.registerTemperature(temperature: 56.0)
//
//
//public struct ThermometerStruct {
//    private(set) var temperature: Double = 0.0
//    public mutating func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}

//var thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(temperature: 56.0)
//var animals = ["fish", "cat","chicken","dog"]
//let sortedAnimal = animals.sorted { $0 < $1 }
//print(sortedAnimal)
//
//
//let str1 = "str1"
//var str2 = "str2"
//str1 = "dsd"
//
//class someClass {
//   static let str1 = "str1"
//   static var str2 = "str2"
//
//    func chnage() {
//        someClass.str1 = "3"
//       someClass.str2 = "5"
//    }
//}

struct MyStruct {
    var num : Int = 0
}

class  MyClass {
    var myStruct: MyStruct
    var text: String = "a"
    init(_ myStruct: MyStruct) {
        self.myStruct = myStruct
    }
}

var myClass1 = MyClass(MyStruct(num: 0))
var myClass2 = myClass1
print(myClass1.myStruct.num)
myClass2.myStruct.num = 1
myClass2.text = "b"
print(myClass2.myStruct.num)
print(myClass1.myStruct.num)
print(myClass1.text)


func nextGreaterElements(_ nums: [Int]) -> [Int] {
    var stack: [Int] = []
    for (index,element) in nums.enumerated(){
        var start = (index + 1) % nums.count
        while start != index {
            if element < nums[start] {
               stack.append(nums[start])
                break
            }
            start = (start + 1) % nums.count
        }
        if start == index {
            stack.append(-1)
        }
    }
    return stack
}

print(nextGreaterElements([100,1,11,1,120,111,123,1,-1,-100]))
//[100,1,11,1,120,111,123,1,-1,-100]



@discardableResult
func convertIntegerToString(_ num: Int) -> String {
    return "\(num)"
}


convertIntegerToString(1)



