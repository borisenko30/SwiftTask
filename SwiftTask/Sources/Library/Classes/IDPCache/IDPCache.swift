//
//  IDPCache.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPCache {
    var models: NSMapTable<NSURL, IDPImageModel> = NSMapTable.strongToWeakObjects()
    static let sharedCache: IDPCache = IDPCache()
    
    func set(model: IDPImageModel, url: URL) {
        models.setObject(model, forKey: url as NSURL)
    }
    
    func remove(url: URL) {
        models.removeObject(forKey: url as NSURL)
    }
    
    func model(for url: URL) -> IDPImageModel? {
        return models.object(forKey: url as NSURL)
    }
}
