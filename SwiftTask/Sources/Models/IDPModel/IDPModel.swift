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

class IDPModel: IDPObservableObject<IDPModelState> {
    
    private let lock = NSLock()
    
    init() {
        super.init(with: IDPModelState.didUnload)
    }
    
    func load() {
        lock.synchronized {
            let state = self.state
            if state == IDPModelState.willLoad || state == IDPModelState.didLoad {
                self.notify(of: state)
            } else {
                self.state = IDPModelState.willLoad
            }
        }
        
        IDPGCD.dispatchAsyncInBackground {
            self.performLoading()
        }
    }
    
    // should be overriden in subclasses
    func performLoading() {
        
    }
}
