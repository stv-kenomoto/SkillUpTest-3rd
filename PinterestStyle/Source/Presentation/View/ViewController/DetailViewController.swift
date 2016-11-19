//
//  DetailViewController.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var photoModel: PhotoModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }

    private func setupImageView() {
        guard let photoModel = photoModel else {
            return
        }

        imageView.image = photoModel.image
    }
}
