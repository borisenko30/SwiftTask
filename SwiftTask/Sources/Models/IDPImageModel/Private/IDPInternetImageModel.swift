//
//  IDPInternetImageModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/19/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPInternetImageModel: IDPFileSystemImageModel {
    var sessionTask = URLSessionDownloadTask() {
        didSet {
            sessionTask.resume()
        }
    }
    
    override func load(_ completionBlock: @escaping IDPCompletionBlock) {
        let cached: Bool = self.isCached() ?? false
        
        if cached {
            super.load({ (image: UIImage?, error: Error?) in
                if (image != nil) {
                    completionBlock(image, error)
                } else {
                    self.removeCachedFile()
                    self.download(completionBlock)
                }
            })
        } else {
            self.download(completionBlock)
        }
    }
    
    func download(_ completionBlock: @escaping IDPCompletionBlock) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        
        self.sessionTask = session.downloadTask(with: self.url!,
                                   completionHandler: {(location: URL?, response: URLResponse?, error: Error?) in
                                        let fileManager = FileManager.default
                                        do {
                                            try fileManager.moveItem(at: location! , to: self.localURL!)
                                        } catch {
                                            print("Error occured while trying to move file!")
                                        }
                                    
                                        let image = UIImage(contentsOfFile: (self.localURL?.path)!)
                                        completionBlock(image, error)
                                    })
    }
    
    private func isCached() -> Bool? {
        return cast(self.localURL.map(FileManager.fileExists(at:)))
    }
    
    private func removeCachedFile() {
        do {
            try self.localURL.map(FileManager.default.removeItem(at:))
        } catch {
            print("Error occured while removing cached file...")
        }
    }
}
