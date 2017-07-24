//
//  IDPObservableObject.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

typealias IDPControllerNotificationBlock = (IDPObservationController?) -> Void

class IDPObservableObject: NSObject {
    var observationControllers: NSHashTable<IDPObservationController> = NSHashTable.weakObjects()
    
    // setters for state
    var state: Int = 0 {
        didSet{
            IDPGCD.synchronize(self) {
                if self.state != oldValue {
                    self.notify(state: self.state)
                }
            }
        }
    }
    
    func set(state: Int, for object: Any?) {
        IDPGCD.synchronize(self) {
            if self.state != state {
                self.state = state
                self.notify(state: state, object: object)
            }
        }
    }
    
    // add-remove controller methods
    func observationController(observer: Any?) -> IDPObservationController {
        let controller = IDPObservationController(observer: observer as AnyObject, observableObject: self)
        self.observationControllers.add(controller)
        
        return controller
    }
    
    func invalidate(controller: IDPObservationController) {
        self.observationControllers.remove(controller)
    }
    
    func invalidateControllers() {
        for controller in self.observationControllers.objectEnumerator() {
            self.observationControllers.remove(controller as? IDPObservationController)
        }
    }
    
    // notify methods
    func notify(state: Int, object: Any? = nil) {
        self.notify(state: state, handler: { (controller: IDPObservationController) in
            controller.notify(state: state, object: object)
        } as? IDPControllerNotificationBlock)
    }
    
    func notify(state: Int, handler: IDPControllerNotificationBlock?) {
        if handler == nil {
            return
        }
        
        IDPGCD.synchronize(self) {
            for controller in self.observationControllers.objectEnumerator() {
                handler?(controller as? IDPObservationController)
            }
        }
    }
}
