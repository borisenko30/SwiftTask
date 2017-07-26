//
//  IDPUser.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPUser: NSObject, NSCoding {
    
    struct User {
        static let id = "id"
        static let name = "name"
        static let about = "about"
        static let birthday = "birthday"
        static let url = "url"
        static let email = "email"
    }
    
    let id: String?
    let name: String?
    var birthday: String?
    var about: String?
    var email: String?
    var imageURL: URL?
    
    let IDPUserName = "IDPUserName"
    let IDPUrlName = "IDPUrlName"
    
    var imageModel: IDPImageModel? {
        return imageURL.map(IDPImageModel.model(with:))
    }
    
    init(id: String, name: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
    
    // MARK: NSCoding methods
    
    required init?(coder aDecoder: NSCoder) {
        let decode: (String) -> Any? = { cast(aDecoder.decodeObject(forKey: $0)) }
        
        self.id = decode(User.id) as? String
        self.name = decode(User.name) as? String
        self.birthday = decode(User.birthday) as? String
        self.about = decode(User.about) as? String
        self.email = decode(User.email) as? String
        self.imageURL = decode(User.url) as? URL
    }
    
    func encode(with aCoder: NSCoder) {
        let encode: (Any?, String) -> () = { aCoder.encode($0, forKey: $1) }
        
        [
            (self.id, User.id),
            (self.name, User.name),
            (self.birthday, User.birthday),
            (self.about, User.about),
            (self.email, User.email),
            (self.imageURL, User.url)
        ]
            .forEach(encode)
    }
}


