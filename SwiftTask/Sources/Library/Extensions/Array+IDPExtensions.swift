//
//  Array+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension Array {
    func object<Value>(type: Value.Type) -> Element? {
        return self.first(where: {$0 is Value})
    }
}
