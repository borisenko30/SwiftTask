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
        self.state = IDPContextState.willLoad.rawValue
        super.execute(object: object)
    }
    
    override func processData(_ data: Any?) {
        let friend: Dictionary<String, Any>? = cast(data)
        
        let birthday: String? = cast(friend?["birthday"])
        let about: String? = cast(friend?["about"])
        let email: String? = cast(friend?["email"])
        let pictureURL = ((friend?["picture"]
            as? Dictionary<String, Any>)?["data"]
            as? Dictionary<String, Any>)?["url"]
            as? String ?? ""

        let user = self.controller?.user
        
        user?.birthday = birthday
        user?.about = about
        user?.email = email
        user?.imageURL = URL(string: pictureURL)
        
        self.controller?.mainView?.user = user
        
        self.state = IDPContextState.didLoad.rawValue
    }
}
