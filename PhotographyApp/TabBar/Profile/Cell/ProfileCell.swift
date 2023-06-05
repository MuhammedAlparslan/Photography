//
//  ProfileCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 3.06.2023.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
 
    
    func configureData(data: Profile) {
        nameLabel.text = data.name
        nameLabel.textColor = .white
    }
    
}
