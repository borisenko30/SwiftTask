//
//  RootViewGettable.swift
//  SwiftTask
//
//  Created by Student003 on 7/31/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

protocol RootViewGettable {
    associatedtype RootViewType: UIView
}

extension RootViewGettable
    where Self: UIViewController
{
    var rootView: RootViewType? {
        return cast(self.viewIfLoaded)
    }
}
