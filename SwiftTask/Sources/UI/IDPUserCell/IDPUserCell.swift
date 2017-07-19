//
//  IDPUserCell.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPUserCell: IDPTableViewCell {
    @IBOutlet var userImageView: IDPImageView?
    @IBOutlet var nameLabel: UILabel?

    required init?(coder aDecoder: NSCoder) {
        userImageView = IDPImageView()
        nameLabel = UILabel()
            
        super.init(coder: aDecoder)
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        userImageView = IDPImageView()
        nameLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
