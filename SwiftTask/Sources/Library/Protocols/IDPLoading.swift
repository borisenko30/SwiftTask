//
//  IDPLoading.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

protocol IDPLoading {
    func set(loading: Bool, animations: (() -> Void)?, completionHandler: ((Bool) -> Void)?)
}
