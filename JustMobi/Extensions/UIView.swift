//
//  UIView.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

extension UIView {
    func addBlurredStatusBar() {
        let blurryEffect = UIBlurEffect(style: .regular)
        let blurredStatusBar = UIVisualEffectView(effect: blurryEffect)
        blurredStatusBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurredStatusBar)
        blurredStatusBar
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        blurredStatusBar
            .widthAnchor
            .constraint(equalTo: widthAnchor)
            .isActive = true
        blurredStatusBar
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        blurredStatusBar
            .bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
            .isActive = true
    }
}
