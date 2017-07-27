//
//  URL+IDPExtensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/18/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension URL {
    func fileSystemURL() -> URL {
        let fileName = self.relativePath.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        
        let path = String(format: "%@/%@%@", FileManager.applicationURL.path, self.host ?? "", fileName ?? "")
        
        return URL(fileURLWithPath: path)
    }
}
