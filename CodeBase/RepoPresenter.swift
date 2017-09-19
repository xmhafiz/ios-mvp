//
//  RepoPresenter.swift
//  CodeBase
//
//  Created by Hafiz on 19/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import Foundation

class RepoPresenter {
    var view: RepoView!
    
    func attachView(view: RepoView) {
        self.view = view
    }
    
    func fetchData() {
        view.showLoading()
        
        ReposityService.getData() { (success, data, errorMessage) in
            
            self.view.hideLoading()
            
            if let repos = data, !repos.isEmpty {
                self.view.reloadList(data: repos)
            }
            else {
                self.view.showEmptyView()
            }
        }
    }
}
