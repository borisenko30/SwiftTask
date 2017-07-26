//
//  FriendsDetailView.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class FriendsDetailView: IDPLoadingViewContainer {
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var birthdayLabel: UILabel?
    @IBOutlet var aboutLabel: UILabel?
    @IBOutlet var userImageView: IDPImageView?
    
    required init?(coder aDecoder: NSCoder) {
        userImageView = IDPImageView()
        nameLabel = UILabel()
        
        super.init(coder: aDecoder)
    }
    
    var user: IDPUser? {
        didSet {
            self.fill(user: user)
        }
    }
    
    func fill(user: IDPUser?) {
        nameLabel?.text = user?.name
        birthdayLabel?.text = user?.birthday
        aboutLabel?.text = user?.about
        userImageView?.imageModel = user?.imageModel
    }

}
