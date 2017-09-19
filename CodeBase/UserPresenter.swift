//
//  UserPresenter.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import Foundation

class UserPresenter {
    var view: UsersView!
    
    func attachView(view: UsersView) {
        self.view = view
    }
    
    func fetchData() {
        view.showLoading()
        
        UserService.getUsers() { (success, data, errorMessage) in
            
            self.view.hideLoading()
            
            if let users = data, !users.isEmpty {
                self.view.reloadList(data: users)
            }
            else {
                self.view.showEmptyView()
            }
        }
    }
}
