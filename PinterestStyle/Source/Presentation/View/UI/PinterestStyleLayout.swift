//
//  PinterestStyleLayout.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

protocol PinterestStyleLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath , withWidth: CGFloat) -> CGFloat

    func collectionView(_ collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

final class PinterestStyleLayout: UICollectionViewLayout {

    static let defaultColumnCount = 2

    static let defaultCellPadding: CGFloat = 8

    var delegate: PinterestStyleLayoutDelegate?

    var columnCount = defaultColumnCount

    var cellPadding = defaultCellPadding

    private var cache = [PinterestStyleLayoutAttributes]()

    private var contentHeight: CGFloat = 0

    var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }

    override class var layoutAttributesClass : AnyClass {
        return PinterestStyleLayoutAttributes.self
    }

    override func prepare() {

        guard cache.isEmpty else{
            return
        }

        let columnWidth = contentWidth / CGFloat(columnCount)
        var xOffset = [CGFloat]()

        for column in 0 ..< columnCount {
            xOffset.append(CGFloat(column) * columnWidth)
        }

        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: columnCount)

        for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let width = columnWidth - cellPadding * 2
            let photoHeight = delegate!.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth: width)
            let labelHeight = delegate!.collectionView(collectionView!, heightForAnnotationAtIndexPath: indexPath, withWidth: width)
            let height = cellPadding + photoHeight + labelHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = PinterestStyleLayoutAttributes(forCellWith: indexPath)
            attributes.height = photoHeight
            attributes.frame = insetFrame
            cache.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height

            if column >= columnCount - 1 {
                column = 0
            } else {
                column += 1
            }
        }
    }

    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }

        return layoutAttributes
    }
}
