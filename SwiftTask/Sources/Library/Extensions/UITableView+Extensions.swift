//
//  UITableView+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UITableView {
    
    @nonobjc static var registeredNib = Dictionary<String, UINib>()
    
    func reusableCell<Result: UITableViewCell> (
        _ type: Result.Type,
        for indexPath: IndexPath,
        configure: (Result) -> ()
    )
        -> UITableViewCell
    {
        let identifier = String(describing: type)
        let nib: UINib
        
        if (UITableView.registeredNib[identifier] == nil) {
            nib = UINib.nib(type)
            self.register(nib, forCellReuseIdentifier: identifier)
            UITableView.registeredNib[identifier] = nib
        }
        
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cast(cell).do(configure)
        
        return cell
    }
}
