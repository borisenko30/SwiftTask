//
//  IDPObservationController.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

typealias IDPStateChangeHandler = (IDPObservationController, Any?) -> Void

class IDPObservationController: Comparable {
    var observer: AnyObject?
    var observableObject: AnyObject?
    var states: Dictionary = [Int : Any]()
    
    init(observer: AnyObject, observableObject: AnyObject) {
        self.observer = observer
        self.observableObject = observableObject
    }
    
    func set(handler: @escaping IDPStateChangeHandler, for state: Int) {
        self.states[state] = handler
    }
    
    func remove(handler: @escaping IDPStateChangeHandler, for state: Int) {
        self.states[state] = nil
    }
    
    func handler(for state: Int) -> IDPStateChangeHandler? {
        return self.states[state] as? IDPStateChangeHandler
    }
    
    subscript(index: Int) -> Any? {
        get{
            return self.handler(for: index)
        }
        set {
            self.set(handler: newValue as! IDPStateChangeHandler, for: index)
        }
    }
    
    func notify(state: Int, object: Any? = nil) {
        if let handler = self[state] as? IDPStateChangeHandler {
            handler(self, object)
        }
    }
    
    // MARK: Comparable protocol
    
    static func < (lhs: IDPObservationController, rhs: IDPObservationController) -> Bool {
        return false
    }
    
    static func == (lhs: IDPObservationController, rhs: IDPObservationController) -> Bool {
        return lhs === rhs
    }
}
