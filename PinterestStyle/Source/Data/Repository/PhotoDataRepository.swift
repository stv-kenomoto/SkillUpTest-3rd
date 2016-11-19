//
//  PhotoDataRepository.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import RxSwift

final class PhotoDataRepository {

    let photoCache: PhotoCache

    init(photoCache: PhotoCache) {
        self.photoCache = photoCache
    }
}

// MARK: - PhotoRepository
extension PhotoDataRepository: PhotoRepository {

    func photoObservable() -> Observable<[PhotoModel]> {
        return photoCache
            .photoObservable()
            .map { (photoEntities: [PhotoEntity]) in
                let photoModelMapper = PhotoModelMapper()
                return photoModelMapper.transform(photoEntities)
        }
    }
}
