//
//  IDPImageModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

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
        
        let model = IDPImageModel(url: url)
        cache.set(model: model, url: url)
        return model
    }
    
    init(url: URL) {
        super.init()
        self.url = url
    }
    
    override func performLoading() {
        
    }
    
}
