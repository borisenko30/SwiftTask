//
//  IDPCache.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

struct Weak<Value: AnyObject>: Equatable {
    private(set) weak var value: Value?
    
    init(_ value: Value?) {
        self.value = value
    }
    
    static func ==(lhs: Weak<Value>, rhs: Weak<Value>) -> Bool {
        return lhs.value.flatMap { lhs in
            rhs.value.flatMap { lhs === $0 }
        } ?? false
    }
}

class IDPCache {
    typealias WeakModelReference = Weak<IDPImageModel>
    
    var models: [URL: WeakModelReference]? = [:]
    static let sharedCache: IDPCache = IDPCache()
    private let lock = NSLock()
    
    func set(model: IDPImageModel, for url: URL) {
        lock.synchronized {
            models = models.apply(filter)
            models?[url] = Weak(model)
        }
    }
    
    func remove(url: URL) {
        lock.synchronized {
            models = models.apply(filter)
            models?[url] = nil
        }
    }
    
    func model(for url: URL) -> IDPImageModel? {
        return lock.synchronized {
            models = models.apply(filter)
            return models?[url]?.value
        }
    }
    
    private func filter(_ dictionary: [URL: WeakModelReference]) -> [URL: WeakModelReference] {
        let validKeys = dictionary.keys.filter { dictionary[$0]?.value != nil }
        
        var result: [URL: WeakModelReference] = [:]
        validKeys.forEach { result[$0] = dictionary[$0] }
        
        return result
    }
}
