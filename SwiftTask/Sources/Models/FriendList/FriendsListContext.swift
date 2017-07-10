//
//  FriendsListContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/10/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import FBSDKCoreKit

public class FriendListContext: NSObject {
    
    public func friends(callBack: @escaping (Any?)->Void) -> Any {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath:"me/friends",
                parameters:["fields": "id,name,gender,picture,friends.limit(100){picture,name}"]
            )
        
        fbRequestFriends.start { (connection, result, error) in
            if error == nil && result != nil {
                callBack(result)
            } else {
                print("Error \(String(describing: error))")
            }
        }
        
        return "getFriends"
    }
}
