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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButtonTouch() {
        IDPLoginContext().execute(object: self) {_ in
            let controller = IDPFriendsViewController()
            controller.friends = IDPUsersModel()
            
            IDPFriendListContext().execute(object: controller) { _ in
                print("friendList received...")
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
