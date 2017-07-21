//
//  IDPImageView.swift
//  SwiftTask
//
//  Created by Student003 on 7/17/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPImageView: IDPLoadingViewContainer {

    var contentImageView: UIImageView? {
        didSet {
            if contentImageView != oldValue  {
                oldValue?.removeFromSuperview()
                self.addSubview(contentImageView!)
            }
        }
    }
    
    var imageModel: IDPImageModel? {
        didSet {
            if imageModel != oldValue {
                self.contentImageView?.image = nil
                oldValue?.invalidateControllers()
                self.observer = imageModel?.observationController(observer: self)
                imageModel?.load()
            }
        }
    }
    
    var observer: IDPObservationController? {
        didSet {
            if observer != oldValue {
                self.prepare(observer: observer)
            }
        }
    }
    
    deinit {
        self.contentImageView = nil
        self.imageModel = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubviews()
    }
    
    func initSubviews() {
        let imageView = UIImageView(frame: self.bounds)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentImageView = imageView
    }
    
    
    func prepare(observer: IDPObservationController?) {
        let willLoadHandler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.loading = true
        }
        
        observer?.set(handler: willLoadHandler, for: IDPModelState.willLoad.rawValue)
        
        let didFailHandler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.imageModel?.load()
        }
        
        observer?.set(handler: didFailHandler, for: IDPModelState.didFailLoading.rawValue)
        
        let didLoadHandler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.loading = false
            self.contentImageView?.image = (userInfo as? IDPImageModel)?.image
            print("")
        }
        
        observer?.set(handler: didLoadHandler, for: IDPModelState.didLoad.rawValue)
    }
}
