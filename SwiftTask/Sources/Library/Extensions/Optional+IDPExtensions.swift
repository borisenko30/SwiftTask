//
//  Optional+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension Optional {
    func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
    
    func apply<Result>(_ function: ((Wrapped) -> Result)?) throws -> Result? {
        return function.flatMap{function in
            self.flatMap(function)
        }
    }
    
    func apply<Value, Result>(_ value: Value?) -> Result?
        where Wrapped == (Value) -> Result
    {
        return self.flatMap { function in
            value.flatMap(function)
        }
    }
    
    
}

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}

func weakify<Value: AnyObject, Arguments, Result>(
    _ function: @escaping (Value) -> (Arguments) -> Result,
    object: Value,
    default value: Result
    )
    -> (Arguments) -> Result
{
    return { [weak object] arguments in
        object.map { function($0)(arguments) } ?? value
    }
}

func weakify<Value: AnyObject, Arguments>(
    _ function: @escaping (Value) -> (Arguments) -> (),
    object: Value
    )
    -> (Arguments) -> ()
{
    return weakify(function, object: object, default: ())
}

func curry<A, B, C>(_ function: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { arg in
        { return function(arg, $0) }
    }
}
