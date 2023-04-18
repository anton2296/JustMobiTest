//
//  RootViewController.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import UIKit

final class RootViewController: UIViewController {
    private let almostInstagramVC: AlmostInstagramVC = {
        let layout = AlmostInstagramLayout()
        let viewController = AlmostInstagramVC(collectionViewLayout: layout)
        layout.delegate = viewController
        return viewController
    }()
    private let presentViewController = PresentViewController()
    private let bannerView = BannerView()

    override func viewDidLoad() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        super.viewDidLoad()
        addChild(almostInstagramVC)
        view.addSubview(almostInstagramVC.view)
        view.addSubview(bannerView)
        addChild(presentViewController)
        view.addSubview(presentViewController.view)

        bannerView.translatesAutoresizingMaskIntoConstraints = false
        almostInstagramVC.view.translatesAutoresizingMaskIntoConstraints = false
        presentViewController.view.translatesAutoresizingMaskIntoConstraints = false

        bannerView
            .topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        bannerView
            .leadingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                        constant: 16)
            .isActive = true
        view.safeAreaLayoutGuide
            .trailingAnchor
            .constraint(equalTo: bannerView.trailingAnchor,
                        constant: 16)
            .isActive = true
        bannerView
            .heightAnchor
            .constraint(equalToConstant: 108)
            .isActive = true
        almostInstagramVC
            .view
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        almostInstagramVC
            .view
            .leftAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
            .isActive = true
        almostInstagramVC
            .view
            .rightAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            .isActive = true
        almostInstagramVC
            .view
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
        
        view
            .rightAnchor
            .constraint(equalTo: presentViewController.view.rightAnchor,
                        constant: 14)
            .isActive = true
        view
            .bottomAnchor
            .constraint(equalTo: presentViewController.view.bottomAnchor,
                        constant: 41)
            .isActive = true
        presentViewController
            .view
            .heightAnchor
            .constraint(equalToConstant: 88)
            .isActive = true
        presentViewController
            .view
            .widthAnchor
            .constraint(equalToConstant: 88)
            .isActive = true
    }
}
