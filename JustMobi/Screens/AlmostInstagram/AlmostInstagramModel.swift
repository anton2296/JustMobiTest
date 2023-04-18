//
//  AlmostInstagramViewModel.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import Foundation
import UIKit

struct AlmostInstagramModel {
    var images: [Photo] = {
        (1...20).compactMap { index in
            let width = Int.random(in: 500...1000)
            let height = Int.random(in: 500...1000)
            let url = URL(
                string: "https://source.unsplash.com/user/c_v_r/\(width)x\(height)"
            )
            //Случайная картинка из ентернетов с заданой высотой/шириной
            return Photo(
                id: index,
                width: width,
                height: height,
                url: url)
        }
    }()
    let hashTags: [String] = ["#Осень",
                              "#Портрет",
                              "#Insta-стиль",
                              "#Люди",
                              "#На-блюде",
                              "#Еще",
                              "#Текст"]
}

struct Photo {
    let id: Int
    let width: Int
    let height: Int
    let url: URL?
}
