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

    override func viewDidLoad() {
        super.viewDidLoad()

        IDPFriendListContext().execute(object: self) { _ in
            print("friendList received...")
        }
    }
    
    // MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: IDPUserCell = tableView.reusableCell(cellClass: IDPUserCell.self) as! IDPUserCell
        
        cell.user = IDPUser(name:"Vasya")
        
        return cell;
    }
    
    // MARK: UITableViewDelegate
    
    @nonobjc public func tableView(_ tableView: UITableView, didEndDisplaying cell: IDPUserCell, forRowAt indexPath: IndexPath)
    {
        cell.user = nil
    }
}
