//
//  IDPFriendsViewController.swift
//  SwiftTask
//
//  Created by Student003 on 7/13/17.
//  Copyright © 2017 Student003. All rights reserved.
//

import UIKit

class IDPFriendsViewController: IDPViewController, UITableViewDataSource, UITableViewDelegate, RootViewGettable {
    @IBOutlet var tableView: UITableView?
    
    typealias RootViewType = IDPFriendsView
    typealias CellType = IDPUserCell
    
    var friends: IDPUsersModel?
    var friendListContext: IDPFriendListContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.register(UINib.nib(CellType.self), forCellReuseIdentifier: String(describing: CellType.self))
        
        friendListContext = IDPFriendListContext(with: "me/friends",
                                                 ["fields": "id,name,picture"])
        self.observer = friendListContext?.observationController(observer: self)
        friendListContext?.execute(object: self)
    }
    
    // MARK -
    // MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell(IDPUserCell.self, for: indexPath) { (result) in
            result.user = self.friends?[indexPath.row]
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showFriendInfo(at: indexPath)
    }
    
    // MARK -
    // MARK: UITableViewDelegate
    
    @nonobjc public func tableView(_ tableView: UITableView, didEndDisplaying cell: IDPUserCell, forRowAt indexPath: IndexPath)
    {
        cell.user = nil
    }
    
    // MARK -
    // MARK: IDPViewContorller override
    
    override func prepare(observer: IDPViewController.ObserverType?) {
        observer?[IDPContextState.willLoad] = { _ in
            self.rootView?.isLoading = true
        }
        
        observer?[IDPContextState.didLoad] = { _ in
            self.rootView?.isLoading = false
            self.tableView?.reloadData()
        }
    }
    
    // MARK -
    // MARK Private
    
    private func showFriendInfo(at indexPath: IndexPath) -> () {
        let controller = FriendsDetailViewController.viewController()
        let user = self.friends?[indexPath.row]
        controller.user = user
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
