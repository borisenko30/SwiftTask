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

class IDPLoginViewController: UIViewController {
    @IBOutlet var loginView: IDPLoginView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initMainView()
    }
    
    @IBAction func onLoginButtonTouch() {
        IDPLoginContext().execute(object: self) { _ in
            let controller = IDPFriendsViewController()
            controller.friends = IDPUsersModel()
            
            IDPFriendListContext().execute(object: controller) { (success: Bool) in
                print("friendList received...")
                
                self.navigationController?.pushViewController(controller, animated: true)
                
                if success {
                    controller.mainView?.loading = false
                } else {
                    print("Error: can not login on FB")
                }
            }
        }
    }
    
    private func initMainView() -> () {
        if self.loginView == nil {
            self.loginView = self.view as! IDPLoginView!
        }
    }
}
