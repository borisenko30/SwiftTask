//
//  FacebookContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/25/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class FacebookContext: IDPBaseContext {
    struct User {
        static let id = "id"
        static let name = "name"
        static let data = "data"
        static let about = "about"
        static let email = "email"
        static let picture = "picture"
        static let birthday = "birthday"
        static let url = "url"
    }
    
    private var graphPath: String
    private var parameters: [String : Any]
    private var connection: FBSDKGraphRequestConnection?
    
    deinit {
        self.cancel()
    }
    
    init(with graphPath: String, _ parameters: Dictionary<String, Any>) {
        self.graphPath = graphPath
        self.parameters = parameters
        super.init()
    }
    
    override func execute(object: AnyObject) {
        self.state = IDPContextState.willLoad
        requestInfo()
    }
    
    override func cancel() {
        connection?.cancel()
    }
    
    func requestInfo() {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath: self.graphPath,
                parameters: self.parameters
            )

        connection = fbRequestFriends.start { (connection, result, error) in
            if error == nil && result != nil {
                self.processData(result)
                self.state = IDPContextState.didLoad
            } else {
                print("Error \(String(describing: error))")
            }
        }
    }
    
    // MARK: should be overriden in subclasses
    
    func processData(_ data: Any?) {
        
    }
}
