//
//  IDPLoadingViewContainer.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPLoadingViewContainer: UIView {
    var loading: Bool = false {
        didSet{
            (loading) ? self.set(loading: true, alpha: 1.0): self.set(loading: false, alpha: 0.0)
        }
    }
    var loadingView: IDPLoadingView? {
        didSet{
            oldValue?.removeFromSuperview()
            if loadingView != nil {
                self.addSubview(loadingView!)
            }
        }
    }
 
    func defaultLoadingView() -> IDPLoadingView {
        return IDPLoadingView.loadingView(superView: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadingView = defaultLoadingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadingView = defaultLoadingView()
    }
    
    func set(loading: Bool, alpha: CGFloat) {
        self.loadingView?.set(loading: loading, animations: { 
            self.loadingView?.alpha = alpha
        })
    }

    
}
