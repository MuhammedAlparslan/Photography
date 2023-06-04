//
//  TopicCell.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 4.06.2023.
//

import UIKit

class TopicCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel       : UILabel!
    @IBOutlet private weak var topicImageView   : UIImageView!
    
    func configureData(data: Topic) {
        guard let url           = data.coverPhoto?.urls?.raw else { return }
        titleLabel.text         = data.title
        topicImageView.loadUrl(url)
    }
}

