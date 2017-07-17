//
//  IDPNavigationController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

enum IDPState: Int {
    case IDPStateDidLoad, IDPStateDidChange, IDPStateUnload
}

class IDPNavigationController: UINavigationController {
    
    var observer: IDPObservationController? {
        didSet {
            if observer != oldValue {
                self.prepare(observer: observer)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testObj = IDPTest()
        
        self.observer = testObj.observationController(observer: self)
        
        testObj.state = IDPState.IDPStateDidChange.rawValue
        testObj.state = IDPState.IDPStateUnload.rawValue
        testObj.state = IDPState.IDPStateDidLoad.rawValue
        
        self.pushViewController(IDPLoginViewController(), animated: true)
    }
    
    func prepare(observer: IDPObservationController?) {
        let handler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            print("handler1")
        }
        
        let handler2 = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            print("handler2")
        }
        
        observer?.set(handler: handler, for: 1)
        observer?.set(handler: handler2, for: 2)
    }
}


class IDPTest: IDPObservableObject {
    
}
