//
//  IDPUser.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPUser: Comparable {
    let name: String
    let imageURL: URL
    
    init(name: String, imageURL: URL) {
        self.name = name
        self.imageURL = imageURL
    }
    
    // MARK: Comparable methods
    
    static func < (lhs: IDPUser, rhs: IDPUser) -> Bool {
        return false
    }
    
    static func == (lhs: IDPUser, rhs: IDPUser) -> Bool {
        return lhs === rhs
    }
}


