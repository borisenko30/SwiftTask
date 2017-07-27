//
//  IDPLoginContext\.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class IDPLoginContext: IDPBaseContext {
    override func execute(object: AnyObject) {
        let loginManager = LoginManager()
        
        loginManager.logIn([ .publicProfile ], viewController: object as? UIViewController) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success:
                print("logged in...");
                self.state = IDPContextState.didLoad
            }
        }
    }
}
