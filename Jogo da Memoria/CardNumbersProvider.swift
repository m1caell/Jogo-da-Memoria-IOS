//
//  CardNumbersProvider.swift
//  Jogo da Memoria
//
//  Created by Pablo Trindade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol CardNumberProvider {
    func text(for identifier: Int) -> String
}

class NumbersProvider2: CardNumberProvider {
    var numbersOptions = ["1","2","3","4","5","6","7","8","9","10"]
    
    var numbers = [Int: String]()
    
    func text(for identifier: Int) -> String {
        if let number = numbers[identifier] {
            return number
        }
        
        let number = numbersOptions.removeRandom()
        
        numbers[identifier] = number
        
        return number
    }
}
