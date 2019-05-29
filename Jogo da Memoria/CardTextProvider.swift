//
//  CardTextProvider.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation


protocol CardTextProvider: AnyObject {
    func text(for identifier: Int) -> String
    var emojis: [Int: String] {get set}
    var emojisOptions: [String] {get set}
}

extension CardTextProvider {
    func text(for identifier: Int) -> String {
        if let emoji = emojis[identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.removeRandom()
        
        emojis[identifier] = emoji
        
        return emoji
    }
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    var emojis = [Int: String]()
    var emojisOptions = ["🐱","🐶","🦊","🐹","🐮","🐦","🐵","🐒","🦋","🕸"]
}

class NumbersProvider: CardTextProvider {
    var emojis = [Int: String]()
    var emojisOptions = ["1","2","3","4","5","6","7","8","9","10"]
}
