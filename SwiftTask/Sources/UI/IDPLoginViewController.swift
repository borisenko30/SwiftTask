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
            self.navigationController?.pushViewController(IDPFriendsViewController(), animated: true)
        }
    }
}
