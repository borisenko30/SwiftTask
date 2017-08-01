//
//  IDPFileSystemImageModel.swift
//  SwiftTask
//
//  Created by Student003 on 7/19/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPFileSystemImageModel: IDPImageModel {
    override func load(_ completionBlock: @escaping IDPCompletionBlock) {
        completionBlock( LoadingResult.value(UIImage(contentsOfFile: self.localURL.path)!) )
    }
}
