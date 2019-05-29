//
//  WelcomeViewController.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let gameSegue = "show-game"
    
    var cardTextProvider: CardTextProvider?
    
    @IBAction func touchEmoticons(_ sender: Any) {
        self.cardTextProvider = CuteAnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    @IBAction func touchNumbers(_ sender: Any) {
        self.cardTextProvider = NumbersProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvider
        }
    }
}
