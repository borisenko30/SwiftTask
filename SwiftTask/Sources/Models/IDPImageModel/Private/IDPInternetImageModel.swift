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
        
        self.url.do {
            self.sessionTask = session.downloadTask(
                                    with: $0,
                                    completionHandler: {(location, response, error) in
                                        location.do{
                                            try? FileManager.default.moveItem(at: $0, to: self.localURL)
                                            let image = UIImage(contentsOfFile: self.localURL.path)
                                            completionBlock(image, error)
                                        }
                                    }
            )
        }
    }
    
    private func isCached() -> Bool? {
        return FileManager.fileExists(at: self.localURL)
    }
    
    private func removeCachedFile() {
        try? FileManager.default.removeItem(at: self.localURL)
    }
}
