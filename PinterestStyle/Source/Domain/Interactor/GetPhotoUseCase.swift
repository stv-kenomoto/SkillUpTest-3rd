//
//  GetPhotoUseCase.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import RxSwift

protocol GetPhotoUseCase {

    func execute(_ on: @escaping (Event<[PhotoModel]>) -> Void)
}
