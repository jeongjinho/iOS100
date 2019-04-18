//
//  BitOperator.swift
//  DataStructures
//
//  Created by jeongjinho on 18/04/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation


public struct BitOperator {
    
  static func makeRemainer() {
        
        let divide = 4
        let pedivi = 4
        
        let remainer = divide & (pedivi - 1)
        print("\(divide)를 \(pedivi)로 나눈 나머지는 \(remainer) 이다. \n")
    }
  static func isEvenNumber(_ value: Int) -> Bool {
        let opt: Int? = nil
        let opt2: Int? = .none
        print(opt)
        print(opt2)
        return value & 1 == 0 ? true : false
    }
}
