//
//  FileManager+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension FileManager {
    
    // MARK: Class properties
    
    class var libraryFolderURL: URL {
        return self.url(for: .libraryDirectory)
    }
    
    class var documentsFolderURL: URL {
        return self.url(for: .documentDirectory)
    }
    
    class var myFolderURL: URL {
        return self.folderURL(with: "MyFolder")
    }
    
    // MARK: Class methods
    
    class func fileExist(in path: String) -> Bool {
        return self.default.fileExists(atPath: path)
    }
    
    class func url(for directory: FileManager.SearchPathDirectory) -> URL {
        let urlString: String = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
        
        return URL(fileURLWithPath: urlString)
    }
    
    class func folderURL(with name: String) -> URL {
        let libraryURL: URL = FileManager.libraryFolderURL
        let filePath = URL(fileURLWithPath: libraryURL.absoluteString).appendingPathComponent(name)
        do {
            try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error: Folder can't be created")
        }
        
        return filePath
    }
}
