//
//  BannerView.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

final class BannerView: UIView {
    private var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 17)
        label.text = "Try three days free trial"
        return label
    }()

    private var subLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.textColor = .white
        subLabel.font = .systemFont(ofSize: 13)
        subLabel.numberOfLines = 0
        subLabel.text = "You will get all premium templates,\nadditional stickers and no ads"
        subLabel.layer.opacity = 0.5
        return subLabel
    }()

    private var image = UIImageView(image: UIImage(named: "collage"))

    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 139/255,
                    green: 103/255,
                    blue: 239/255,
                    alpha: 1).cgColor,
            UIColor(red: 195/255,
                    green: 115/255,
                    blue: 231/255,
                    alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.9, y: 0.55)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        layer.masksToBounds = true
        addSubview(label)
        addSubview(subLabel)
        addSubview(image)
        label.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 22
        ).isActive = true
        label.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20
        ).isActive = true
        subLabel.topAnchor.constraint(
            equalTo: label.bottomAnchor, constant: 8
        ).isActive = true
        subLabel.leadingAnchor.constraint(
            equalTo: label.leadingAnchor
        ).isActive = true
        subLabel.trailingAnchor.constraint(
            equalTo: label.trailingAnchor, constant: 8
        ).isActive = true
        self.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: subLabel.bottomAnchor, constant: 22
        ).isActive = true
        image.leadingAnchor.constraint(
            greaterThanOrEqualTo: subLabel.trailingAnchor, constant: 8
        ).isActive = true
        self.safeAreaLayoutGuide.trailingAnchor.constraint(
            equalTo: image.trailingAnchor, constant: 20
        ).isActive = true
        image.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 14
        ).isActive = true
        self.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: image.bottomAnchor, constant: 14
        ).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
