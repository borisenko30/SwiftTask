//
//  IDPUser.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPUser: NSObject, NSCoding {
    let name: String?
    let imageURL: URL?
    
    let IDPUserName = "IDPUserName"
    let IDPUrlName = "IDPUrlName"
    
    var imageModel: IDPImageModel? {
        return imageURL.map(IDPImageModel.model(with:))
    }
    
    init(name: String, imageURL: URL) {
        self.name = name
        self.imageURL = imageURL
    }
    
    // MARK: NSCoding methods
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: IDPUserName) as? String
        self.imageURL = aDecoder.decodeObject(forKey: IDPUrlName) as? URL
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name)
        aCoder.encode(self.imageURL)
    }
}


