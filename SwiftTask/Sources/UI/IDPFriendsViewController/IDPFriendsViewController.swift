//
//  IDPFriendsViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPFriendsViewController: IDPViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var mainView: IDPFriendsView?
    
    var friends: IDPUsersModel?
    
    var friendListContext: IDPFriendListContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        friendListContext = IDPFriendListContext()
        self.observer = friendListContext?.observationController(observer: self)
        friendListContext?.execute(object: self)
        self.initMainView()
    }
    
    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as? IDPFriendsView
        }
    }
    
    // MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.friends?.count)!
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
    
    // MARK: IDPViewContorller override
    override func prepare(observer: IDPObservationController?) {
        let handler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.mainView?.loading = false
            self.tableView?.reloadData()
        }
        
        observer?.set(handler: handler, for: IDPContextState.didLoad.rawValue)
    }
}
