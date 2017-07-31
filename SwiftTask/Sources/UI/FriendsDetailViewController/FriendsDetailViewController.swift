//
//  FriendsDetailViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class FriendsDetailViewController: IDPViewController, RootViewGettable {
    typealias  RootViewType = FriendsDetailView
    
    var user: IDPUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        let friendInfoContext = FriendInfoContext(with: user?.id ?? "",
                                                  ["fields": "id,name,gender,picture.type(large),birthday,about,email"])
        self.observer = friendInfoContext.observationController(observer: self)
        friendInfoContext.execute(object: self)
    }
    
    // MARK -
    // MARK: IDPViewContorller override
    
    override func prepare(observer: IDPViewController.ObserverType?) {
        observer?[IDPContextState.willLoad] = { _ in
            self.rootView?.isLoading = false
        }
        
        observer?[IDPContextState.didLoad] = { _ in
            self.rootView?.isLoading = false
        }
    }
}
