//
//  UIImage.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import AVFoundation
import UIKit

extension UIImage {

    func height(width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: self.size, insideRect: boundingRect)
        return rect.size.height
    }
}
