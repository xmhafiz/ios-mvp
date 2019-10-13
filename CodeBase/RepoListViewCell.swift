//
//  RepoListViewCell.swift
//  CodeBase
//
//  Created by Hafiz on 19/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import UIKit

class RepoListViewCell: UITableViewCell {

    static let rowHeight: CGFloat = 66
    static let identifier = "RepoListViewCell"
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        repoNameLabel.font = .boldSystemFont(ofSize: 14)
        repoDescriptionLabel.font = .systemFont(ofSize: 12)
        ownerLabel.font = .boldSystemFont(ofSize: 11)
        
        ownerLabel.textColor = .blueText
        repoDescriptionLabel.textColor = .gray
        
        innerView.rounded(radius: 4)
    }

    func setupCell(repo: Repo) {
        
        self.repoNameLabel.text = repo.title ?? "..."
        self.repoDescriptionLabel.text = repo.description ?? "..."
        self.ownerLabel.text = "By " + (repo.owner?.username ?? "...")
    }
}
