//
//  IDPArrayModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPArrayModel<T:Comparable>: IDPModel {
    var objects: Array<T> = []
    
    func add(object: T) {
        objects.append(object)
    }
    
    func remove(object: T) {
        objects = objects.filter { $0 != object }
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
    
    func count() -> Int {
        return self.objects.count
    }
    
    func index(of object: T) -> Int? {
        return self.objects.index(of: object)
    }
    
    subscript(index: Int) -> T {
        return self.objects[index]
    }
    
    override func performLoading() {
        
    }
}
