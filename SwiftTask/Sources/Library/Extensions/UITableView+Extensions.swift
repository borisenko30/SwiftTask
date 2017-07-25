//
//  UITableView+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<Result: UITableViewCell>(
        cellClass: Result.Type,
        for indexPath: IndexPath
    )
        -> UITableViewCell
    {
        let identifier = String(describing: cellClass)
        self.register(UINib.nib(cellClass), forCellReuseIdentifier: identifier)
        
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    func reusableCell<Result: UITableViewCell>(
        cellClass: Result.Type,
        for indexPath: IndexPath,
        configure: (Result) -> ()
    )
        -> UITableViewCell
    {
        let cell = self.dequeueReusableCell(cellClass: cellClass, for: indexPath)
        
        cast(cell).do(configure)
        
        return cell
    }
}
