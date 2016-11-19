//
//  GetPhoto.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import RxSwift

final class GetPhoto {

    let photoRepository: PhotoRepository

    let disposeBag = DisposeBag()

    init(photoRepository: PhotoRepository) {
        self.photoRepository = photoRepository
    }
}

// MARK: - GetPhotoUseCase
extension GetPhoto: GetPhotoUseCase {

    func execute(_ on: @escaping (Event<[PhotoModel]>) -> Void) {
        photoRepository.photoObservable()
            .subscribe(on)
            .addDisposableTo(disposeBag)
    }
}
