//
//  TopicCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 4.06.2023.
//

import UIKit

class TopicCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel       : UILabel!
    @IBOutlet private weak var descriptionLabel : UILabel!
    @IBOutlet private weak var topicImageView   : UIImageView!
    
    func configureData(data: Topic) {
        guard let url           = data.coverPhoto?.urls?.regular else { return }
        titleLabel.text         = data.title
        descriptionLabel.text   = data.coverPhoto?.altDescription
        topicImageView.loadUrl(url)
    }
}

