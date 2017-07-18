//
//  IDPFriendListContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class IDPFriendListContext: IDPBaseContext {
    override func execute(object: AnyObject) {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath:"me/friends",
                parameters:["fields": "id,name,gender,picture,friends.limit(100){picture,name}"]
        )
        
        self.state = IDPContextState.willLoad.rawValue
        
        fbRequestFriends.start { (connection, result, error) in
            if error == nil && result != nil {
                self.fillFriendList(object: object, result: result)
                self.state = IDPContextState.didLoad.rawValue
            } else {
                print("Error \(String(describing: error))")
            }
        }
    }
    
    override func cancel() {
        
    }
    
    
    func fillFriendList(object: AnyObject, result:Any?) {
        let dictionary = result as! NSDictionary
        let friends = dictionary.value(forKey: "data") as! NSArray

        if let array = friends as? [NSDictionary] {
            for friend : NSDictionary in array {
                let name = friend.value(forKey: "name") as! String
                let wrappedPicture = friend.value(forKey: "picture") as! NSDictionary
                let picture = wrappedPicture.value(forKey: "data") as! NSDictionary
                let url = picture.value(forKey: "url") as! String
                
                let user: IDPUser = IDPUser(name: name, imageURL: URL(fileURLWithPath: url))
                (object as! IDPFriendsViewController).friends?.add(object: user)
            }
        }
    }
}
