//
//  ListComponent.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

protocol ListModule {

    var photoCache: PhotoCache { get }

    var photoRepository: PhotoRepository { get }

    var getPhotoUseCase: GetPhotoUseCase { get }
}

extension ListModule where Self: UIViewController {

    var photoCache: PhotoCache {
        return PhotoPlist()
    }

    var photoRepository: PhotoRepository {
        return PhotoDataRepository(photoCache: photoCache)
    }

    var getPhotoUseCase: GetPhotoUseCase {
        return GetPhoto(photoRepository: photoRepository)
    }
}

extension ListViewController: ListModule {}
