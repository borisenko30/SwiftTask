//
//  FriendsDetailView.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class FriendsDetailView: UIView {
    @IBOutlet var nameLabel: UILabel?
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
        userImageView?.imageModel = user?.imageModel
    }

}
