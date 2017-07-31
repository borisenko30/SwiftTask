//
//  IDPFriendListContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class IDPFriendListContext: FacebookContext {
    private var model: IDPUsersModel?
    
    override func execute(object: AnyObject) {
        self.model = (object as? IDPFriendsViewController)?.friends
        super.execute(object: object)
    }
    
    override func processData(_ data: Any?) {
        let curriedInit = curry(IDPUser.init(id:name:imageURL:))
        
        let dictionary: Dictionary<String, Any>? = cast(data)
        let friends: Array<NSDictionary>? = cast(dictionary?[User.data])

        friends.flatMap {
            $0.flatMap { user -> IDPUser? in
                let id: String? = cast(user[User.id])
                let name: String? = cast(user[User.name])
                let pictureURL = ((user[User.picture]
                                    as? Dictionary<String, Any>)?[User.data]
                                    as? Dictionary<String, Any>)?[User.url]
                                    as? String ?? ""
                
                let url:URL? = URL(string: pictureURL)
                
                return id.apply(curriedInit).apply(name).apply(url)
            }
        }.do { self.model?.add(objects: $0) }
    }
}
