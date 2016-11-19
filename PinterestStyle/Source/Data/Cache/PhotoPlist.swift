//
//  PhotoPlist.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import RxSwift
import UIKit

final class PhotoPlist {

    static let path = Bundle.main.path(forResource: "photos", ofType: "plist")

    static let rootKey = "photos"

    static let captionKey = "caption"

    static let commentKey = "comment"

    static let imageKey = "image"
}

// MARK: - PhotoCache
extension PhotoPlist: PhotoCache {

    func photoObservable() -> Observable<[PhotoEntity]> {
        return Observable.create { (observer: AnyObserver<[PhotoEntity]>)  in
            guard let path = PhotoPlist.path else {
                observer.onError(DataError.notExistPhoto)
                return Disposables.create()
            }

            let dictionary = NSDictionary(contentsOfFile: path)
            let photos = dictionary?[PhotoPlist.rootKey] as! [NSDictionary]
            
            var photoEntities = [PhotoEntity]()
            for photo in photos {
                let caption = photo[PhotoPlist.captionKey] as! String
                let comment = photo[PhotoPlist.commentKey] as! String
                let image = UIImage.init(named: photo[PhotoPlist.imageKey] as! String)
                photoEntities.append(PhotoEntity.init(caption: caption, comment: comment, image: image))
            }

            if photoEntities.isEmpty {
                observer.onError(DataError.notExistPhoto)
            } else {
                observer.onNext(photoEntities)
                observer.onCompleted()
            }

            return Disposables.create()
        }
    }
}
