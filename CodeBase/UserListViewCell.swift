//
//  UserListViewCell.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import UIKit
import SDWebImage

class UserListViewCell: UITableViewCell {

    static let rowHeight: CGFloat = 80
    static let identifier = "UserListViewCell"
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        nameLabel.font = UIFont.regular(size: 14)
        
        innerView.rounded(radius: 4)
        profileImageView.rounded(radius: 56/2, borderWidth: 2, borderColor: .lightGray)
        
    }
    
    func setupCell(user: User) {
        
        self.nameLabel.text = user.username ?? "..."
        self.profileImageView.sd_setImage(with: user.avatarURL?.url, placeholderImage: #imageLiteral(resourceName: "placeholder"), completed: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
