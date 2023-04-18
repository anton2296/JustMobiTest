//
//  HashtagsCollectionViewController.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

final class HashtagsCollectionViewController: UICollectionViewController {
    var hashTags: [String] = []

    override func viewDidLoad() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: 17,
                                                   bottom: 0,
                                                   right: 17)
        collectionView.register(
            HashtagCell.self,
            forCellWithReuseIdentifier: "HashtagCell"
        )
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HashtagCell",
            for: indexPath
        ) as? HashtagCell {
            cell.setText(hashTags[indexPath.item])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        hashTags.count
    }
}

extension HashtagsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = hashTags[indexPath.row]
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 11)
        ])
        return CGSize(width: itemSize.width + 24,
                      height: itemSize.height + 12)
    }
}
