//
//  FriendsDetailViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class FriendsDetailViewController: IDPViewController {
    @IBOutlet var mainView: FriendsDetailView?
    
    var user: IDPUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMainView()
        let friendInfoContext = FriendInfoContext(with: (user?.id)!,
                                                  ["fields": "id,name,gender,picture.type(large),birthday,about,email"])
        self.observer = friendInfoContext.observationController(observer: self)
        friendInfoContext.execute(object: self)
    }
    
    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as? FriendsDetailView
        }
    }
    
    // MARK -
    // MARK: IDPViewContorller override
    
    override func prepare(observer: IDPViewController.ObserverType?) {
        observer?[IDPContextState.willLoad] = { _ in
            self.mainView?.isLoading = false
        }
        
        observer?[IDPContextState.didLoad] = { _ in
            self.mainView?.isLoading = false
        }
    }
}
