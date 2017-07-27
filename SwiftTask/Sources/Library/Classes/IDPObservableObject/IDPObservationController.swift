//
//  IDPObservationController.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPObservationController<ObservableObject, State>: NSObject
    where
    ObservableObject: IDPObservableObject<State>,
    State: Hashable
{
    // MARK: -
    // MARK: Subtypes
    
    typealias ObservableObjectType = ObservableObject
    typealias StateType = ObservableObject.StateType
    typealias CallbackType = (ObservableObjectType) -> ()
    
    weak var observer: AnyObject?
    weak var observableObject: ObservableObjectType?
    private var states = [StateType : CallbackType]()
    
    init(observer: AnyObject, observableObject: ObservableObjectType) {
        self.observer = observer
        self.observableObject = observableObject
    }
    
    subscript(state: StateType) -> CallbackType? {
        get { return self.states[state] }
        set { self.states[state] = newValue }
    }
    
    func notify(of state: State) {
        self.observableObject.apply(self.states[state])
    }
}
