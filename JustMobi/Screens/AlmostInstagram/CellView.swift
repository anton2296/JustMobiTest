//
//  CellView.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit
import Kingfisher

final class CellView: UICollectionViewCell {
    var photo: Photo? {
        didSet {
            if let url = photo?.url {
                imageView.kf.setImage(
                    with: url,
                    options: [.cacheMemoryOnly,
                              .loadDiskFileSynchronously])
                { _ in
                    self.activityIndicator.stopAnimating()
                    self.imageView.isHidden = false
                }
            }
        }
    }
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        addSubview(imageView)
        imageView.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        imageView.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor
        ).isActive = true
        imageView.trailingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        imageView.heightAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.heightAnchor
        ).isActive = true
        addSubview(activityIndicator)
        activityIndicator.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        activityIndicator.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor
        ).isActive = true
        activityIndicator.trailingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        activityIndicator.heightAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.heightAnchor
        ).isActive = true
        activityIndicator.startAnimating()
        imageView.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}
