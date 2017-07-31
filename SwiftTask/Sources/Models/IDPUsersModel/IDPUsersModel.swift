//
//  IDPUsersModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPUsersModel: IDPArrayModel<IDPUser> {
    let IDPFileName = "usersModel.plist"
    let filePath: String
    
    override init() {
        filePath = String(format: "%@/%@", FileManager.applicationURL.path, IDPFileName)
    }
    
    override func performLoading() {
        let result = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        
        if result != nil {
            self.add(objects: (result as? Array<IDPUser>)!)
        }
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.objects, toFile: filePath)
    }
}
