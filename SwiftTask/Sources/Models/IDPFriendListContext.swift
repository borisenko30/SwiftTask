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
        self.model = (object as! IDPFriendsViewController).friends
        self.state = IDPContextState.willLoad.rawValue
        super.execute(object: object)
    }
    
    override func processData(_ data: Any?) {
        let curriedInitUser = curry(IDPUser.init(id:name:imageURL:))
        
        let dictionary: Dictionary<String, Any>? = cast(data)
        let friends: Array<NSDictionary>? = cast(dictionary?["data"])

        friends.map {
            $0.map { user in
                let id: String? = cast(user["id"])
                let name: String? = cast(user["name"])
                let pictureURL = ((user["picture"]
                                    as? Dictionary<String, Any>)?["data"]
                                    as? Dictionary<String, Any>)?["url"]
                                    as? String ?? ""
                
                let url:URL? = URL(string: pictureURL)
                let newUser = url.apply(name.apply(id.apply(curriedInitUser)))
                
                newUser.apply(self.model?.add(object:))
            }
        }
        
        self.state = IDPContextState.didLoad.rawValue
    }
}
