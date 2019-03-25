//
//  main.swift
//  FileManager
//
//  Created by jeongjinho on 14/03/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation

//// Swift에서는 NS 접두사가 빠진 FileManager로 사용합니다.
//
//
////FileManaer 객체 가져오기 ( 싱글턴 객체)
//let fileManager = FileManager.default
//
//
//// MacOS 기준
//
//
//// 파일들을 확인하는 법을 알아보겠습니다.
//let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//do {
//    let contents = try fileManager.contentsOfDirectory(atPath: documentDirectory.path)
//    // 해당 도큐멘트 디렉토리안에 파일 및 디렉토리가 나오는 것을 알 수 있습니다.
//    print(contents)
//} catch let error {
//    print(" file list error description: \(error.localizedDescription)")
//}
//
//// 이 도큐멘트 디렉토리 안에 swift 파일을 하나 만들어 보겠습니다.
//
//let fileName = "TestSwift.swift"
//let filePath = documentDirectory.appendingPathComponent(fileName)
//let  swiftCodeString = "import Foundation \n\n print(\"hello swift!\")"
//do {
//    try swiftCodeString.write(to: filePath, atomically: false, encoding: .utf8)
//
//} catch let error {
//    print(" file writing error description: \(error.localizedDescription)")
//}
//
////파일을 만들었으니 불러오도록 하겠습니다.
//
//do {
//    let helloSwiftString = try String(contentsOf: filePath, encoding: .utf8)
//    print(helloSwiftString)
//} catch let error {
//    print(" file reading error description: \(error.localizedDescription)")
//}
//// 새로운 디렉토리 생성
//let tempDirectoryPath = documentDirectory.appendingPathComponent("TempDirectory")
//if !fileManager.fileExists(atPath: tempDirectoryPath.path) {
//    do {
//        try fileManager.createDirectory(at: tempDirectoryPath, withIntermediateDirectories: true, attributes: nil)
//    } catch let error {
//        print(" directory initializing error description: \(error.localizedDescription)")
//    }
//}
//// 새로생긴 디렉토리에 스위프트 파일 옮기기
//let movePath = tempDirectoryPath.appendingPathComponent(fileName)
//
//if !fileManager.fileExists(atPath: movePath.path) {
//
//    do {
//        try fileManager.moveItem(at: filePath, to: movePath)
//    } catch let error {
//        print(" directory moving error description: \(error.localizedDescription)")
//    }
//}
//do {
//  let destinationPath = try fileManager.contentsOfDirectory(atPath: tempDirectoryPath.path)
//    print(destinationPath)
//} catch let error {
//    print(" directory list error description: \(error.localizedDescription)")
//}
//
//// 파일 지우기
//do {
//    try fileManager.removeItem(at: movePath)
//} catch let error {
//    print(" file deleting error description: \(error.localizedDescription)")
//}


let command = SwiftCommand()
command.touch("temp1file.swift") // 파일 만들고
command.mkdir("test")
command.cd("..")
command.cd("Documents/..")
command.cat("Documents/../Documents/temp1file.swift")


