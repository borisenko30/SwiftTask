//
//  IDPImageModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

enum LoadingError: Error {
    case didFailLoading
}

enum Result<Value, Error> {
    case value(Value)
    case error(Error)
}

typealias LoadingResult = Result<UIImage, LoadingError>
typealias IDPCompletionBlock = (LoadingResult) -> ()

class IDPImageModel: IDPModel {
    var image: UIImage?
    var url: URL?
    var localURL: URL
    
    let cache: IDPCache = IDPCache.sharedCache
    
    class func model(with url: URL) -> IDPImageModel {
        let cache: IDPCache = IDPCache.sharedCache
        
        if let model = cache.model(for: url) {
            return model
        }
        
        let model = url.isFileURL ? IDPFileSystemImageModel(with: url) : IDPInternetImageModel(with: url)
        cache.set(model: model, for: url)
        
        return model
    }
    
    init(with url: URL) {
        self.localURL = url.fileSystemURL()
        super.init()
        self.url = url
    }
    
    override func performLoading() {
        IDPGCD.dispatchAsyncInBackground {
            self.state = IDPModelState.willLoad
            self.load {
                switch $0 {
                case .error:
                    self.state = IDPModelState.didFailLoading
                case .value(let image):
                    IDPGCD.dispatchOnMainQueue {
                        self.image = image
                        self.state = IDPModelState.didLoad
                    }
                }
            }
        }
    }
    
    // should be overriden in subclasses
    func load(_ completionBlock: @escaping IDPCompletionBlock) {
        
    }
}
