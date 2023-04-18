//
//  Array.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 15.04.2023.
//

import Foundation

extension Array {
    func indexOf(_ index: Int) -> Element? {
        if index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
