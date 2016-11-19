//
//  ListView.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

protocol ListView: class {

    func viewDetail(photoModel: PhotoModel?)

    func renderPhoto(photoModels: [PhotoModel])

    func showError()
}
