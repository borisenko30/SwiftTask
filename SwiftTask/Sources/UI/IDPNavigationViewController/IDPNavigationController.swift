//
//  IDPNavigationController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(IDPLoginViewController(), animated: true)
    }
}
