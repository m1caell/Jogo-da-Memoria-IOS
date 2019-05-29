//
//  Game.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    var cards: [Card] = []
    
    var cardCompared: Int?
    var lastIndexClicked: Int?
    var turn: Int = 0
    
    init(numberOfPairOfCards: Int) {
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            self.cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards.indices.contains(index) {
            return
        }
        
        if index == self.lastIndexClicked {
            return
        }
        
        if cards[index].cardState == .matched {
            return
        }
        
        self.turn += 1
        
        if self.turn == 3 {
            cards[self.lastIndexClicked!].cardState = .back
            cards[self.cardCompared!].cardState = .back
            self.turn = 0
            return
        }
        
        if self.turn == 2 {
            self.cardCompared = self.lastIndexClicked!
            if cards[index].identifier == cards[self.lastIndexClicked!].identifier {
                cards[index].cardState = .matched
                cards[self.lastIndexClicked!].cardState = .matched
                self.turn = 0
                return
            }
        }
        
        if cards[index].cardState == CardState.back {
            cards[index].cardState = .front
            self.lastIndexClicked = index
        }
    }
}

struct Card {
    var identifier: Int
    var cardState: CardState = .back
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}

enum CardState {
    case back
    case front
    case matched
}
