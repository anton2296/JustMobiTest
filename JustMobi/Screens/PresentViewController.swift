//
//  PresentViewController.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 17.04.2023.
//

import UIKit
import Combine

final class PresentViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private let imageView = UIImageView(image: UIImage(named: "animation"))
    private var timer: Timer?
    private var startDate = Date()
    private let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    override func viewDidLoad() {
        let timer = Timer(timeInterval: 1.0,
                          target: self,
                          selector: #selector(updateTimer),
                          userInfo: nil,
                          repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        timer.tolerance = 0.3
        self.timer = timer
        startDate = Date()
        super.viewDidLoad()
        addAnimation()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        view.layer.cornerRadius = 44
        view.layer.masksToBounds = true
        view.addSubview(imageView)
        view.addSubview(label)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        imageView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor
        ).isActive = true
        imageView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        imageView
            .heightAnchor
            .constraint(equalToConstant: 56)
            .isActive = true
        imageView
            .widthAnchor
            .constraint(equalToConstant: 56)
            .isActive = true
        label.topAnchor.constraint(
            equalTo: imageView.bottomAnchor
        ).isActive = true
        label.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor
        ).isActive = true
        label.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: label.bottomAnchor, constant: 15
        ).isActive = true
        label
            .heightAnchor
            .constraint(equalToConstant: 14)
            .isActive = true
    }

    private func addAnimation() {
        let wobble = CAKeyframeAnimation(keyPath: "transform.rotation")
        wobble.values = [0.0, -0.2, 0.0, -0.2, 0.0, 0.0]
        wobble.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4, 1.0]
        wobble.duration = 1
        wobble.isAdditive = true
        wobble.repeatCount = Float.greatestFiniteMagnitude
        self.imageView.layer.add(wobble, forKey: "wobble")
    }

    private func pushRickRoll() {
        guard let rickRollUrl = URL(string: "https://youtu.be/dQw4w9WgXcQ?autoplay=1") else {
            return
        }
        let webViewVC = WKWebViewController()
        webViewVC.webView.configuration.allowsInlineMediaPlayback = true
        webViewVC.webView.load(URLRequest(url: rickRollUrl))
        present(webViewVC, animated: true)
    }

    @objc private func updateTimer() {
        let timeInterval = (startDate + 30 * 60).timeIntervalSinceNow
        if timeInterval > 0 {
            label.text = formatter.string(from: timeInterval)
        } else {
            timer?.invalidate()
            timer = nil
            pushRickRoll()
        }
        
    }
}
