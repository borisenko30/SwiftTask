//
//  IDPViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPViewController: UIViewController {
    typealias ObserverType = IDPObservableObject<IDPContextState>.ControllerType
    
    var observer: ObserverType? {
        didSet {
            if observer != oldValue {
                self.prepare(observer: observer)
            }
        }
    }

    // should be overriden in subclasses
    func prepare(observer: ObserverType?) {

    }
}
