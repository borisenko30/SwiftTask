//
//  UITableView+Extensions.swift
//  SwiftTask
//
//  Created by Student003 on 7/14/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<Value>(cellClass: Value.Type) -> UITableViewCell? {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass))
    }
    
    func reusableCell<Value>(cellClass: Value.Type) -> UITableViewCell? {
        var cell: Any? = self.dequeueReusableCell(cellClass: cellClass)
        
        if cell == nil {
            cell = UINib.object(className:cellClass);
        }
        
        return cell as! UITableViewCell?;
    }
}
