//
//  ActivityIndicatorLoadingView.swift
//  SwiftTask
//
//  Created by Student003 on 7/25/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class  ActivityIndicatorLoadingView: UIView, AlphaLoadingView {
    
    @IBOutlet var indicatorView: UIActivityIndicatorView?
    
    static func loadingView(in superView: UIView) ->  ActivityIndicatorLoadingView? {
        let loadingView: ActivityIndicatorLoadingView? = UINib.object(className: ActivityIndicatorLoadingView.self)
        
        loadingView?.frame = superView.bounds
        loadingView.do(superView.addSubview)
        loadingView?.setNeedsDisplay()
        loadingView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        return loadingView
    }

}
