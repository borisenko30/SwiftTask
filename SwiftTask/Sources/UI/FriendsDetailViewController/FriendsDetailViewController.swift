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
        self.mainView?.user = self.user
    }
    
    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as? FriendsDetailView
        }
    }
}
