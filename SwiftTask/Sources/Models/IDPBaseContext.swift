//
//  IDPBaseContext.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

enum IDPContextState: Int {
    case didUnload, didLoad, didFailLoading, willLoad
}

class IDPBaseContext: IDPObservableObject<IDPContextState> {
    
    init() {
        super.init(with: IDPContextState.willLoad)
    }
    
    func execute(object: AnyObject) {
        
    }
    
    func cancel() {
        
    }
}
