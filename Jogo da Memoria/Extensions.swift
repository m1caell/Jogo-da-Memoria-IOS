//
//  Extensions.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

extension Array {
    mutating func removeRandom() -> Element {
        return self.remove(at: Int.random(in: self.indices))
    }
}
