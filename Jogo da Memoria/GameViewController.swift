//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var cardTextProvider: CardTextProvider!
    
    @IBOutlet var buttonsArray: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender) {
            self.game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            
            flipCount += 1
        }
    }
    
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            
            if(card.cardState == .front) {
                button.backgroundColor = .white
                button.setTitle(self.cardTextProvider.text(for: card.identifier), for: .normal)
            } else if card.cardState == .back {
                button.backgroundColor = .orange
                button.setTitle(" ", for: .normal)
            } else {
                button.backgroundColor = .clear
                button.setTitle(" ", for: .normal)
            }
        }
    }
}

