//
//  PinterestStyleLayoutAttributes.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

final class PinterestStyleLayoutAttributes: UICollectionViewLayoutAttributes {

    var height: CGFloat = 0

    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! PinterestStyleLayoutAttributes
        copy.height = height
        return copy
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? PinterestStyleLayoutAttributes {
            if attributes.height == height {
                return super.isEqual(object)
            }
        }

        return false
    }
}
