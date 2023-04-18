//
//  HashtagsHeaderView.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 17.04.2023.
//

import UIKit

final class HashtagsHeaderView: UICollectionReusableView {
    private let vStackView: UIStackView = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.text = "Подходит для:"
        let view = UIView()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        view
            .heightAnchor
            .constraint(equalToConstant: 16)
            .isActive = true
        label
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        label
            .leftAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                        constant: 17)
            .isActive = true
        label
            .rightAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            .isActive = true
        label
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
        let vStackView = UIStackView(arrangedSubviews: [view])
        vStackView.axis = .vertical
        vStackView.spacing = 0
        return vStackView
    }()

    func setHashtagsView(_ hashtagsView: UIView) {
        if vStackView.arrangedSubviews.count == 2,
           let hashtagsStackView = vStackView.arrangedSubviews.last {
            vStackView.removeArrangedSubview(hashtagsStackView)
        }
        vStackView.addArrangedSubview(hashtagsView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vStackView)
        vStackView.topAnchor.constraint(
            equalTo: self.topAnchor
        ).isActive = true
        vStackView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor
        ).isActive = true
        vStackView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor
        ).isActive = true
        vStackView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor
        ).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
