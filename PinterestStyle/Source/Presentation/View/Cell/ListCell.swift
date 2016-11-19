//
//  ListCell.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

final class ListCell: UICollectionViewCell {

    @IBOutlet weak var imageViewHeightLayoutConstraints: NSLayoutConstraint!

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var captionLabel: UILabel!

    @IBOutlet weak var commentLabel: UILabel!

    var photoModel: PhotoModel? {
        didSet {
            guard let photoModel = photoModel else {
                return
            }

            imageView.image = photoModel.image
            captionLabel.text = photoModel.caption
            commentLabel.text = photoModel.comment
        }
    }

    override func prepareForReuse() {
        imageView.image = nil
        captionLabel.text = ""
        commentLabel.text = ""
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let layoutAttributes = layoutAttributes as? PinterestStyleLayoutAttributes {
            imageViewHeightLayoutConstraints.constant = layoutAttributes.height
        }
    }
}
