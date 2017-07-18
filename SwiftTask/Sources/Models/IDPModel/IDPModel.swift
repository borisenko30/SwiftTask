//
//  IDPModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

enum IDPModelState: Int {
    case    didUnload,
            didLoad,
            didFailLoading,
            willLoad
}

class IDPModel: IDPObservableObject, Comparable {
    func load() {
        self.performLoading()
    }
    
    // should be overriden in subclasses
    func performLoading() {
        
    }
    
    // MARK: Comparable methods
    
    static func < (lhs: IDPModel, rhs: IDPModel) -> Bool {
        return false
    }
    
    static func == (lhs: IDPModel, rhs: IDPModel) -> Bool {
        return lhs === rhs
    }
}
