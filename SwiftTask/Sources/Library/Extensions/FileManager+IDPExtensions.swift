//
//  FileManager+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

struct FileURL {
    let value: URL
    
    init?(_ url: URL) {
        if !url.isFileURL {
            return nil
        }
        
        self.init(unsafe: url)
    }
    
    init?(_ string: String) {
        if let url = URL(string: string) {
            self.init(url)
        }
        
        return nil
    }
    
    init(unsafe string: String) {
        self.init(unsafe: URL(fileURLWithPath: string))
    }
    
    init(unsafe url: URL) {
        self.value = url
    }
}

extension FileManager {
    
    // MARK: Class properties
    
    static let libraryFolderURL = FileManager.url(for: .libraryDirectory)
    static let documentsFolderURL = FileManager.url(for: .documentDirectory)
    static let applicationURL = FileManager.folderURL(with: "applicationURL")
    
    // MARK: Class methods
    
    class func fileExists(at url: URL) -> Bool {
        return self.default.fileExists(atPath: url.path)
    }

    class func url(for directory: FileManager.SearchPathDirectory) -> FileURL {
        let urlString: String = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
        
        return FileURL(unsafe: urlString)
    }
    
    class func folderURL(with name: String) -> URL {
        let libraryURL: URL = FileManager.libraryFolderURL.value
        let filePath = URL(fileURLWithPath: libraryURL.absoluteString).appendingPathComponent(name)

        try? FileManager.default.createDirectory(
            atPath: filePath.path,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        return filePath
    }
}
