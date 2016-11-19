//
//  ListPresenter.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import RxSwift

final class ListPresenter {

    weak var listView: ListView?

    let getPhotoUseCase: GetPhotoUseCase

    init(getPhotoUseCase: GetPhotoUseCase) {
        self.getPhotoUseCase = getPhotoUseCase
    }

    func initialize() {
        getPhoto()
    }

    func onPhotoTaped(photoModel: PhotoModel?) {
        listView?.viewDetail(photoModel: photoModel)
    }

    private func getPhoto() {
        getPhotoUseCase.execute { [weak self] (event: Event<[PhotoModel]>) in
            guard let weakSelf = self else {
                return
            }

            switch event {
            case .next(let photoModels):
                weakSelf.showPhotoInView(photoModels: photoModels)

            case .error( _):
                weakSelf.showViewError()
                
            case .completed:
                break
            }
        }
    }

    private func showPhotoInView(photoModels: [PhotoModel]) {
        listView?.renderPhoto(photoModels: photoModels)
    }

    private func showViewError() {
        listView?.showError()
    }
}
