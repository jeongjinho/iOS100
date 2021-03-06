//
//  SwiftCommand.swift
//  FileManager
//
//  Created by jeongjinho on 14/03/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import Foundation

public class SwiftCommand {
    typealias PathReturn = (path: URL?, isDirectory: Bool)
    init() {
        print("\n⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️\n")
    }
    deinit {
        print("\n⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️\n")
    }
    public var pwd: String {
        get {
            print(currentPath.path)
            return currentPath.path
        }
    }
    private var currentPath: URL = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    private let fileManager: FileManager = FileManager.default
    
    public func cd(_ mark : String) {
        guard let path = getFinalDestinationPath(path: mark).path else { return }
        currentPath = path
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
        print(currentPath.appendingPathComponent(fileName))
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
            for subfile in subFiles {
                print(subfile)
            }
            
        } catch let error {
            print(" file list error description: \(error.localizedDescription)")
        }
    }
    public func mv(_ file: String, _ destinationPath: String) {
        let filePath = currentPath.appendingPathComponent(file)
        if isDirectory(destinationPath){
        let destination = currentPath.appendingPathComponent(destinationPath).appendingPathComponent(file)
            move(filePath, destination)
            return
        }
        rm(destinationPath)
        let destination = currentPath.appendingPathComponent(destinationPath)
        move(filePath, destination)
        
    }
    public func rm(_ file: String) {
        var isDirectory : ObjCBool = false
        let current = currentPath.appendingPathComponent(file)
        if fileManager.fileExists(atPath:current.path, isDirectory: &isDirectory) {
            if isDirectory.boolValue {
                print(" file delete error description: this path is not file")
                return
            }
        }
        do {
           try self.fileManager.removeItem(atPath: current.path)
        } catch {
            print(" file delete error description:/ \(error.localizedDescription)")
        }
    }
    public func rmdir(_ file: String) {
        var isDirectory : ObjCBool = false
        let current = currentPath.appendingPathComponent(file)
        if fileManager.fileExists(atPath:current.path, isDirectory: &isDirectory) {
            if !isDirectory.boolValue {
                print(" directory delete error description: this path is not directory")
                return
            }
        }
        do {
            try self.fileManager.removeItem(atPath: current.path)
        } catch {
            print(" directory delete error description:/ \(error.localizedDescription)")
        }
    }
    public func cp (_ path: String, _ destination: String) {
        
        let startPath = currentPath.appendingPathComponent(path)
        let destinationPath = currentPath.appendingPathComponent(destination).appendingPathComponent(path)
        do {
           try fileManager.copyItem(at: startPath, to: destinationPath)
        } catch {
            print(" file copy error description:/ \(error.localizedDescription)")
        }
    }
    public func cat(_ filepath: String) {
        
        guard let tempPath = getFinalDestinationPath(path: filepath).path else { return }
        
        let path = tempPath
        if  fileManager.isReadableFile(atPath: path.path) {
            do {
                let contents = try String.init(contentsOf: path)
                print(contents)
            } catch {
                print(" file reading error description:/ \(error.localizedDescription)")
            }
          
        } else {
            
        }
    }
    //MARK  - private Method
    private func isDirectory(_ path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let tempPath = currentPath.appendingPathComponent(path)
        fileManager.fileExists(atPath: tempPath.path, isDirectory: &isDirectory)
       return isDirectory.boolValue
    }
    private func move(_ path: URL, _ destination: URL) {
        do {
            try fileManager.moveItem(at: path, to: destination)
        } catch let error {
            print(" directory moving error description:/ \(error.localizedDescription)")
        }
    }
    private func getFinalDestinationPath(path: String) -> PathReturn {
        var tempCurrentPath = currentPath
        var tempIsDirectory: Bool = false
        let pathArray = path.split(separator: "/")
        for mark in pathArray {
            switch mark {
            case "..":
                tempCurrentPath = tempCurrentPath.deletingLastPathComponent()
            default :
                 let pathURL = tempCurrentPath.appendingPathComponent(String(mark))
                 if fileManager.fileExists(atPath: pathURL.path) {
                    tempCurrentPath = tempCurrentPath.appendingPathComponent(String(mark))
                     tempIsDirectory = isDirectory(String(mark))
                 } else {
                    return (nil,tempIsDirectory)
                }
            }
        }
        return (tempCurrentPath,tempIsDirectory)
    }
}



