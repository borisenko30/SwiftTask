//
//  IDPLoginViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FacebookLogin
//import FacebookCore

class IDPLoginViewController: IDPViewController {
    @IBOutlet var loginView: IDPLoginView?
    
    var loginContext: IDPLoginContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginContext = IDPLoginContext()
        self.observer = loginContext?.observationController(observer: self)
        self.initMainView()
    }
    
    @IBAction func onLoginButtonTouch() {
        self.login()
    }
    
    private func initMainView() -> () {
        if self.loginView == nil {
            self.loginView = self.view as? IDPLoginView
        }
    }
    
    private func login() {
        loginContext?.execute(object: self)
    }
    
    // MARK: IDPViewContorller override
    override func prepare(observer: IDPObservationController?) {
        let handler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            let friendsViewController = IDPFriendsViewController()
            friendsViewController.friends = IDPUsersModel()
            self.navigationController?.pushViewController(friendsViewController, animated: true)
        }
        
        observer?.set(handler: handler, for: IDPContextState.didLoad.rawValue)
    }
}
