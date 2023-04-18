//
//  HashtagCell.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

final class HashtagCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textColor = UIColor(red: 100/255,
                                  green: 210/255,
                                  blue: 255/255,
                                  alpha: 1)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 100/255,
                                  green: 210/255,
                                  blue: 255/255,
                                  alpha: 0.15)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(
            equalTo: self.topAnchor, constant: 6
        ).isActive = true
        label.leadingAnchor.constraint(
            equalTo: self.leadingAnchor, constant: 12
        ).isActive = true
        label.trailingAnchor.constraint(
            equalTo: self.trailingAnchor, constant: -12
        ).isActive = true
        label.bottomAnchor.constraint(
            equalTo: self.bottomAnchor, constant: -6
        ).isActive = true
    }

    func setText(_ text: String) {
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
