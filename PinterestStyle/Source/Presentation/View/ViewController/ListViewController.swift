//
//  ListViewController.swift
//  PinterestStyle
//
//  Created by Kouki Enomoto on 2016/11/19.
//  Copyright © 2016年 enomt. All rights reserved.
//

import AVFoundation
import RxSwift
import UIKit

final class ListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var errorLabel: UILabel!

    var listDataSource = ListDataSource()

    var listPresenter: ListPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupListPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    private func setupCollectionView() {
        collectionView.register(ListCell.self)
        collectionView.dataSource = listDataSource
        collectionView.delegate = self
        if let pinterestStyleLayout = collectionView.collectionViewLayout as? PinterestStyleLayout {
            pinterestStyleLayout.delegate = self
        }
    }

    private func setupListPresenter() {
        listPresenter = ListPresenter(getPhotoUseCase: getPhotoUseCase)
        listPresenter?.listView = self
        listPresenter?.initialize()
    }
}

// MARK: - ListView
extension ListViewController: ListView {

    func viewDetail(photoModel: PhotoModel?) {
        if let navigationController = self.navigationController {
            Navigator.navigateToDetail(navigationController: navigationController, photoModel: photoModel)
        }
    }

    func renderPhoto(photoModels: [PhotoModel]) {
        listDataSource.photoModels = photoModels
        collectionView.reloadData()
    }

    func showError() {
        errorLabel.isHidden = false
    }
}

// MARK: - UICollectionViewDelegate
extension ListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listPresenter?.onPhotoTaped(photoModel: listDataSource.photoModels?[indexPath.row])
    }
}

// MARK: - PinterestStyleLayoutDelegate
extension ListViewController: PinterestStyleLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath , withWidth: CGFloat) -> CGFloat {
        guard let image = listDataSource.photoModels?[indexPath.row].image else {
            return 0
        }

        return image.height(width: withWidth)
    }

    func collectionView(_ collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        guard let photoModel = listDataSource.photoModels?[indexPath.row] else {
            return 0
        }

        let margin: CGFloat = 24
        return photoModel.caption.height(font: UIFont.systemFont(ofSize: 17), width: width)
            + photoModel.comment.height(font: UIFont.systemFont(ofSize: 17), width: width) + margin
    }
}
