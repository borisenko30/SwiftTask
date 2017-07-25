//
//  IDPLoadingViewContainer.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPLoadingViewContainer: UIView, ComposableLoadingView {
    
    typealias LoadingViewType = ActivityIndicatorLoadingView
    
    class func defaultLoadingView(in view: UIView) -> ActivityIndicatorLoadingView? {
        return ActivityIndicatorLoadingView.loadingView(in: view)
    }
    
    lazy var loadingView: ActivityIndicatorLoadingView? = IDPLoadingViewContainer.defaultLoadingView(in: self)
}
