//
//  PhotoModelMapper.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

final class PhotoModelMapper {

    func transform(_ photoEntities: [PhotoEntity]) -> [PhotoModel] {
        var photoModels = [PhotoModel]()
        for photoEntity in photoEntities {
            photoModels.append(PhotoModel(caption: photoEntity.caption, comment: photoEntity.comment, image: photoEntity.image))
        }

        return photoModels
    }
}
