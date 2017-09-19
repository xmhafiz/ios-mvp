//
//  RepoView.swift
//  CodeBase
//
//  Created by Hafiz on 19/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import UIKit

protocol RepoListInterface {
    func showLoading()
    func hideLoading()
    func showEmptyView()
    func reloadList(data: [Repo])
}

class RepoView: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var tableData = [Repo]()
    
    let presenter = RepoPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        setupView()
        
        presenter.attachView(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.fetchData()
    }
    
    func setupView() {
        self.title = "Repositories"
        view.backgroundColor = .background
    }
    
    func setupTable() {
        
        // setup tableview
        tableView.estimatedRowHeight = RepoListViewCell.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
        // cell setup
        tableView.register(UINib(nibName: RepoListViewCell.identifier, bundle: nil), forCellReuseIdentifier: RepoListViewCell.identifier)
    }
}

extension RepoView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let repo = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoListViewCell.identifier) as! RepoListViewCell
        
        cell.setupCell(repo: repo)
        
        return cell
    }
}

extension RepoView: RepoListInterface {
    func showLoading() {
        tableView.isHidden = true
        spinner.startAnimating()
    }
    
    func hideLoading() {
        spinner.stopAnimating()
    }
    
    func showEmptyView() {
        tableView.isHidden = false
        
        // show some message here
    }
    
    func reloadList(data: [Repo]) {
        tableView.isHidden = false
        tableData = data
        tableView.reloadData()
    }
}
