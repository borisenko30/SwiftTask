//
//  IDPLoginViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FacebookLogin

class IDPLoginViewController: IDPViewController, RootViewGettable {
    typealias RootViewType = IDPLoginView
    
    var loginContext: IDPLoginContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginContext = IDPLoginContext()
        self.observer = loginContext?.observationController(observer: self)
    }
    
    @IBAction func onLoginButtonTouch() {
        self.login()
    }
    
    private func login() {
        loginContext?.execute(object: self)
    }

    // MARK: IDPViewContorller override
    override func prepare(observer: IDPViewController.ObserverType?) {
        observer?[IDPContextState.didLoad] = { _ in
            let friendsViewController = IDPFriendsViewController()
            friendsViewController.friends = IDPUsersModel()
            self.navigationController?.pushViewController(friendsViewController, animated: true)
        }
    }
}
