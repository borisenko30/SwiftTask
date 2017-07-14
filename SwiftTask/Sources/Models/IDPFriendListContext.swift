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
    override func execute(object: AnyObject, completionHandler: @escaping CompletionHandler) {
        self.friendList(callBack: fetchFriendList)
        completionHandler(true)
    }
    
    override func cancel() {
        
    }
    
    public func friendList(callBack: @escaping (Any?)->Void) {
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
    }
    
    func fetchFriendList(result:Any?) {
        let dictionary = result as! NSDictionary
        let friends = dictionary.value(forKey: "data") as! NSArray
        var count = 1
        if let array = friends as? [NSDictionary] {
            for friend : NSDictionary in array {
                let name = friend.value(forKey: "name") as! NSString
                print("\(count) \(name)")
                count += 1
            }
        }
    }
}
