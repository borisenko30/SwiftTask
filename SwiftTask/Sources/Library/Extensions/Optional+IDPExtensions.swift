//
//  Optional+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension Optional{
    func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
}
