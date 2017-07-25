
//
//  IDPLoadingView.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

typealias AnimationCompletionHandler = (( _ success: Bool) -> Void)?

fileprivate struct Animation {
    static let duration = TimeInterval(1.0)
    static let alpha = 1.0
}

protocol LoadingView: class {
    var isLoading: Bool { get set }
    func set(loading: Bool, animated: Bool, completionHandler: AnimationCompletionHandler)
}

extension LoadingView {
    
    func set(loading: Bool, animated: Bool) {
        self.set(loading: loading, animated: animated, completionHandler: nil)
    }
    
    // Function for overriding
    func set(loading: Bool, animated: Bool, completionHandler: AnimationCompletionHandler) {
        
    }
}

protocol AlphaLoadingView: LoadingView { }

extension AlphaLoadingView
    where Self: UIView
{
    var isLoading: Bool {
        get { return self.alpha > 0 }
        set { self.set(loading: newValue, animated: true) }
    }
    
    func set(loading: Bool, animated: Bool, completionHandler: AnimationCompletionHandler) {
        if loading != self.isLoading {
            UIView.animate(
                withDuration: animated ? Animation.duration : 0,
                animations: { self.alpha = CGFloat(loading ? Animation.alpha : 0) },
                completion: completionHandler
            )
        }
    }
}

protocol ComposableLoadingView: LoadingView {
    
    associatedtype LoadingViewType: UIView, LoadingView
    
    var loadingView: LoadingViewType? { get set }
}

extension ComposableLoadingView {
    var isLoading: Bool {
        get {
            var loading = false
            self.loadingView.do { view in loading = view.isLoading }
            
            return loading
        }
        set { self.loadingView?.isLoading = newValue }
    }
}
