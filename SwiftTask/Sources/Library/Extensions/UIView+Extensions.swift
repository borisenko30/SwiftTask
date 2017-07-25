//
//  UIView+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/24/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UIViewController {
    class func viewController() -> Self {
        return self.init(nibName: self.nibName(), bundle: nil)
    }
    
    class func nibName() -> String? {
        return nil
    }
}
