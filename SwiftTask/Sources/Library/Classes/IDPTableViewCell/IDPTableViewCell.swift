//
//  IDPTableViewCell.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPTableViewCell: UITableViewCell {

    override var reuseIdentifier: String? {
        return String(describing:type(of:self))
    }

}
