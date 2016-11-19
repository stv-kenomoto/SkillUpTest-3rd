//
//  ListDataSource.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

final class ListDataSource: NSObject {

    var photoModels: [PhotoModel]?
}

// MARK: - UICollectionViewDataSource
extension ListDataSource: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let photoModels = photoModels else {
            return 0
        }

        return photoModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let listCell: ListCell = collectionView.dequeueReusableCell(for: indexPath)
        if let photoModel = photoModels?[indexPath.row] {
            listCell.photoModel = photoModel
        }

        return listCell
    }
}
