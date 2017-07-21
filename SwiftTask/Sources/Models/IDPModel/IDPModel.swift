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

class IDPModel: IDPObservableObject {
    func load() {
        self.performLoading()
    }
    
    // should be overriden in subclasses
    func performLoading() {
        
    }
}
