//
//  IDPGCD.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

typealias IDPBlock = () -> Void

class IDPGCD {
    class func dispatchOnMainQueue(block: @escaping IDPBlock) {
        DispatchQueue.main.async(execute: block)
    }
    
    class func dispatchAsyncInBackground(block: @escaping IDPBlock) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
}
