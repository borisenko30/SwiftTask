//
//  NSLock+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/27/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import Foundation

extension NSLock {
    func synchronized<Result>(execute: () -> Result) -> Result {
        self.lock()
        defer { self.unlock() }
        
        return execute()
    }
}
