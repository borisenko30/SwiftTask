//
//  UINib+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UINib {
    static func nib<Object>(_ className: Object.Type) -> UINib {
        return self.nib(className: className, bundle: nil)
    }
    
    static func nib<Object>(className: Object.Type, bundle: Bundle?) -> UINib {
        return UINib(nibName: String(describing: className), bundle: bundle)
    }
    
    static func object<Object>(className: Object.Type) -> Object? {
        return self.object(className: className, owner:nil)
    }

    static func object<Object>(className: Object.Type, owner: Any?) -> Object? {
        return self.object(className: className, owner:owner, options:nil)
    }
    
    static func object<Object>(className: Object.Type, owner: Any?, options: [AnyHashable : Any]?) -> Object? {
        let nib: UINib = self.nib(className)
    
        return nib.object(className: className, owner:owner, options:options)
    }
    
    func object<Object>(_ className: Object.Type) -> Object? {
        return self.object(className: className, owner: nil)
    }
    
    func object<Object>(className: Object.Type, owner: Any?) -> Object? {
        return self.object(className: className, owner: owner, options: nil)
    }
    
    func object<Object>(className: Object.Type, owner: Any?, options: [AnyHashable : Any]?) -> Object? {
        let result: Array? = self.instantiate(withOwner: owner, options: options) as? [Object]
        
        return result?.object(type:className)
    }
}
