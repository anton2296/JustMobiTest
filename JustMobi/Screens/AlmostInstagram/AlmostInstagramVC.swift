//
//  ViewController.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

final class AlmostInstagramVC: UICollectionViewController {
    private let viewModel = AlmostInstagramModel()
    private let hashtagsCollectionVC: HashtagsCollectionViewController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let viewController = HashtagsCollectionViewController(
            collectionViewLayout: layout
        )
        return viewController
    }()

    override func viewDidLoad() {
        hashtagsCollectionVC.hashTags = viewModel.hashTags
        addChild(hashtagsCollectionVC)
        let layout = AlmostInstagramLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.contentInset = UIEdgeInsets(top: 123,
                                                   left: 17,
                                                   bottom: 0,
                                                   right: 17)
        view.addBlurredStatusBar()
        navigationController?.isNavigationBarHidden = true
        collectionView.register(
            HashtagsHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerCell")
        collectionView.register(
            CellView.self,
            forCellWithReuseIdentifier: "cell"
        )
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? CellView {
            cell.photo = viewModel.images.indexOf(indexPath.row)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        viewModel.images.count
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView
                .dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "headerCell",
                    for: indexPath as IndexPath) as? HashtagsHeaderView
            headerView?.setHashtagsView(hashtagsCollectionVC.view)
            return headerView ?? UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}

extension AlmostInstagramVC : AlmostInstagramLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath: IndexPath,
                        cellWidth: CGFloat) -> CGFloat {
        let imgHeight = calculateImageHeight(
            sourceImage: viewModel.images[indexPath.row],
            scaledToWidth: cellWidth)
        
        return imgHeight
        
    }
    
    private func calculateImageHeight(sourceImage: Photo,
                                      scaledToWidth: CGFloat) -> CGFloat {
        let oldWidth = CGFloat(sourceImage.width)
        let scaleFactor = scaledToWidth / oldWidth
        let newHeight = CGFloat(sourceImage.height) * scaleFactor
        return newHeight
    }
}
