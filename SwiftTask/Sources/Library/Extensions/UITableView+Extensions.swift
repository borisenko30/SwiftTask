//
//  UITableView+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UITableView {    
    func reusableCell<Result: UITableViewCell> (
        _ type: Result.Type,
        for indexPath: IndexPath,
        configure: (Result) -> ()
    )
        -> UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath)
        cast(cell).do(configure)
        
        return cell
    }
}
