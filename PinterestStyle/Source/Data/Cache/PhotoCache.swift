//
//  PhotoCache.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import Foundation
import RxSwift

protocol PhotoCache {

    func photoObservable() -> Observable<[PhotoEntity]>
}
