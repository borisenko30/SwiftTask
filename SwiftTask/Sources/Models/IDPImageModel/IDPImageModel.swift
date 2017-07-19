//
//  IDPImageModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

typealias IDPCompletionBlock = (_ image: UIImage?, _ error: Error?) -> Void

class IDPImageModel: IDPModel {
    var image: UIImage?
    var url: URL?
    var localURL: URL? {
        return self.url?.fileSystemURL()
    }
    
    let cache: IDPCache = IDPCache.sharedCache
    
    class func model(with url:URL) -> IDPImageModel {
        let cache: IDPCache = IDPCache.sharedCache
        
        if let model = cache.model(for: url) {
            return model
        }
        
        let model = url.isFileURL ? IDPFileSystemImageModel(url: url) : IDPInternetImageModel(url: url)
        cache.set(model: model, for: url)
        
        return model
    }
    
    init(url: URL) {
        super.init()
        self.url = url
    }
    
    override func performLoading() {
        IDPGCD.dispatchAsyncInBackground {
            self.load { (image, error) in
                if error != nil {
                    print(error!)
                } else {
                    IDPGCD.dispatchOnMainQueue {
                        self.image = image
                        //self.state = IDPModelState.willLoad.rawValue
                        self.set(state: IDPModelState.didLoad.rawValue, for: self)
                    }
                }
            }
        }
    }
    
    // should be overriden in subclasses
    func load(_ completionBlock: @escaping IDPCompletionBlock) {
        
    }
}
