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
                contentImageView.do(self.addSubview)
            }
        }
    }
    
    var imageModel: IDPImageModel? {
        didSet {
            if imageModel != oldValue {
                self.contentImageView?.image = nil
                self.observer = imageModel?.observationController(observer: self)
                imageModel?.load()
            }
        }
    }
    
    var observer: IDPObservableObject<IDPModelState>.ControllerType? {
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

    func prepare(observer: IDPObservableObject<IDPModelState>.ControllerType?) {
        observer?[IDPModelState.willLoad] = { _ in
            self.isLoading = true
        }
        
        observer?[IDPModelState.didFailLoading] = { _ in
            self.imageModel?.load()
        }
        
        observer?[IDPModelState.didLoad] = { _ in
            self.isLoading = false
            self.contentImageView?.image = self.imageModel?.image
        }
    }
}
