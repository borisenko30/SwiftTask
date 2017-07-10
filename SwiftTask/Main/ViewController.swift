//
//  ViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/10/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
        myLoginButton.center = view.center;
        myLoginButton.setTitle("My Login Button", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

