//
//  Navigator.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class Navigator {

    private static let detailStoryboardName = "Detail"

    private static let detailStoryboardID = "DetailViewController"

    static func navigateToDetail(navigationController: UINavigationController, photoModel: PhotoModel?) {
        let viewController = UIStoryboard.getViewController(storyboardName: detailStoryboardName,
                                                            storyboardID: detailStoryboardID) as! DetailViewController
        viewController.photoModel = photoModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
