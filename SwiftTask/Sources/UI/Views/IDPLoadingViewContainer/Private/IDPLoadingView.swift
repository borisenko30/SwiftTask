
//
//  IDPLoadingView.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPLoadingView: UIView, IDPLoading {

    @IBOutlet var indicator: UIActivityIndicatorView?
    
    var loading: Bool = true
    
    let IDPAnimationDuration = 1.0
    
    class func loadingView(superView: UIView) -> IDPLoadingView {
        let loadingView: IDPLoadingView = UINib.object(className: IDPLoadingView.self)!
        loadingView.frame = superView.bounds
        superView.addSubview(loadingView)
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return loadingView
    }
    
    // MARK: IDPLoading protocol
    
    func set(loading: Bool, animations: (() -> Void)? = nil, completionHandler: ((Bool) -> Void)? = nil) {
        if animations == nil {
            self.loading = loading
        } else {
            UIView.animate(withDuration: IDPAnimationDuration,
                           animations: animations!,
                           completion: { (finished: Bool) -> Void in
                                self.loading = loading
                                if completionHandler != nil {
                                    completionHandler!(finished)
                                }
                            })
        }
    }
}
