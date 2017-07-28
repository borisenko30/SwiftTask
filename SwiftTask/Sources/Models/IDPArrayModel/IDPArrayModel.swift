//
//  IDPArrayModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPArrayModel<T:Equatable>: IDPModel {
    var objects: Array<T> = []
    var count: Int {
         return self.objects.count
    }
    
    private let lock = NSLock()
    
    func add(object: T) {
        lock.synchronized {
            objects.append(object)
        }
    }
    
    func remove(object: T) {
        lock.synchronized {
            objects = objects.filter { $0 != object }
        }
    }
    
    func add(objects: [T]) {
        for object in objects {
            self.add(object: object)
        }
    }
    
    func remove(objects: [T]) {
        for object in objects {
            self.remove(object: object)
        }
    }
    
    func index(of object: T) -> Int? {
        return lock.synchronized {
             self.objects.index(of: object)
        }
    }
    
    subscript(index: Int) -> T {
        return lock.synchronized {
            self.objects[index]
        }
    }
    
    override func performLoading() {
        
    }
}
