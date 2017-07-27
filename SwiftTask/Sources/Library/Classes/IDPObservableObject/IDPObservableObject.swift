//
//  IDPObservableObject.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPObservableObject<State: Hashable>: NSObject {
    
    // MARK: Subtypes
    
    typealias StateType = State
    typealias ControllerType = IDPObservationController<IDPObservableObject<State>, State>
    
    // MARK: Private properties
    
    private var observationControllers = NSHashTable<ControllerType>.weakObjects()
    
    var state: StateType {
        didSet{
            IDPGCD.synchronize(self) {
                if self.state != oldValue {
                    self.notify(of: self.state)
                }
            }
        }
    }
    
    init(with state: StateType) {
        self.state = state
        
        super.init()
    }
    
    // MARK: Public
    
    func observationController(observer: AnyObject) -> ControllerType {
        let controller = IDPObservationController(observer: observer, observableObject: self)
        self.observationControllers.add(controller)
        
        return controller
    }

    func notify(of state: StateType) {
        self.observationControllers.allObjects.forEach {
            $0.notify(of: state)
        }
    }

}
