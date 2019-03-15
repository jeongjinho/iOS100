//
//  SwiftCommand.swift
//  FileManager
//
//  Created by jeongjinho on 14/03/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation

//typealias ComaandResult : (isSuccess: Bool)

public class SwiftCommand {

    public var path: String {
        get {
          return currentPath.path
        }
    }
    private var currentPath: URL = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    private let fileManager: FileManager = FileManager.default
    
    public func cd(_ mark : String) -> Bool {
        switch mark {
        case "..":
            currentPath = currentPath.deletingLastPathComponent()
            return true
        case "/" :
            currentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return true
        default :
            if(fileManager.fileExists(atPath:currentPath.appendingPathComponent(mark).path)) {
                let newPathString = currentPath.appendingPathComponent(mark).path
                guard let newCurrentURL = URL.init(string: newPathString) else {return false }
                currentPath = newCurrentURL
                return true
            }
            return false
        }
    }
    public func mkdir(_ directoryName: String) {
        let tempDirectoryPath = currentPath.appendingPathComponent(directoryName)
        if !fileManager.fileExists(atPath: tempDirectoryPath.path) {
            do {
                try fileManager.createDirectory(at: tempDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print(" directory initializing error description: \(error.localizedDescription)")
            }
        }
    }
    public func touch(_ fileName: String) {
         let url = currentPath.appendingPathComponent(fileName)
        do {
           try "".write(to: url, atomically: false, encoding: .utf8)
        } catch let error {
            print(" file initializing error description: \(error.localizedDescription)")
        }
    }
    public func ls() {
        do {
        let subFiles = try fileManager.contentsOfDirectory(atPath:currentPath.path)
            print(subFiles)
        } catch let error {
            print(" file list error description: \(error.localizedDescription)")
        }
    }
    
    public func mv(_ file: String, _ destinationDirectory: String) {
    
        let filePath = currentPath.appendingPathComponent(file)
        print(filePath)
        currentPath =  currentPath.appendingPathComponent(destinationDirectory)
        currentPath = currentPath.appendingPathComponent(file)
        print(currentPath)
        if !fileManager.fileExists(atPath: currentPath.path) {
            do {
                try fileManager.moveItem(at: filePath, to: currentPath)
            } catch let error {
                print(" directory moving error description:/ \(error.localizedDescription)")
            }
        }
    }
    
}



