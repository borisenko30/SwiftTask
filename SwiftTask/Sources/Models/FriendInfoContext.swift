//
//  FriendInfoContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class FriendInfoContext: FacebookContext {
    private var controller: FriendsDetailViewController?
    
    override func execute(object: AnyObject) {
        self.controller = object as? FriendsDetailViewController
        super.execute(object: object)
    }
    
    override func processData(_ data: Any?) {
        let friend: Dictionary<String, Any>? = cast(data)
        
        let pictureURL = ((friend?[User.picture]
            as? Dictionary<String, Any>)?[User.data]
            as? Dictionary<String, Any>)?[User.url]
            as? String ?? ""

        let user = self.controller?.user
        
//        func set(_ property: inout String?, key: String) {
//            property = cast(friend?[key])
//        }
        
//        set(&user?.birthday, key: User.birthday)
//        set(&user?.about, key: User.about)
//        set(&user?.email, key: User.email)

        user?.birthday = cast(friend?[User.birthday])
        user?.about = cast(friend?[User.about])
        user?.email = cast(friend?[User.email])
        user?.imageURL = URL(string: pictureURL)
        
        self.controller?.rootView?.user = user
    }
}
