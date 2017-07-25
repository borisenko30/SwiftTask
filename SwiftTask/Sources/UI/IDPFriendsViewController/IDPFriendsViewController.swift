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
    
    // MARK -
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
    
    override func prepare(observer: IDPObservationController?) {
        let willLoadHandler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.mainView?.isLoading = true
        }
        
        observer?.set(handler: willLoadHandler, for: IDPContextState.willLoad.rawValue)
        
        let didLoadHandler = {(controller: IDPObservationController, userInfo: Any?) -> Void in
            self.mainView?.isLoading = false
            self.tableView?.reloadData()
        }
        
        observer?.set(handler: didLoadHandler, for: IDPContextState.didLoad.rawValue)
    }
    
    // MARK -
    // MARK Private
    
    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as? IDPFriendsView
        }
    }
    
    private func showFriendInfo(at indexPath: IndexPath) -> () {
        let controller = FriendsDetailViewController.viewController()
        controller.user = self.friends?[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: true)
        FriendInfoContext().execute(object: controller)
    }
}
