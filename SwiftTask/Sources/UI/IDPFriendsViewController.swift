//
//  IDPFriendsViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    var friends: IDPUsersModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.friends?.count())!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell(cellClass: IDPUserCell.self, for: indexPath) { (result) in
            result.user = self.friends?[indexPath.row]
        }
        
        return cell;
    }
    
    // MARK: UITableViewDelegate
    
    @nonobjc public func tableView(_ tableView: UITableView, didEndDisplaying cell: IDPUserCell, forRowAt indexPath: IndexPath)
    {
        cell.user = nil
    }
}
