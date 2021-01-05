//
//  Concentration.swift
//  Concetration
//
//  Created by Tigran on 1/5/21.
//  Copyright © 2021 Tigran. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0
    var scoreCount = 0
    
    func chooseCard(at index: Int) {
        flipCount += 1
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    scoreCount += 2
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                } else {
                    if cards[index].wasTapped {
                        scoreCount -= 1
                    }
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            cards[index].wasTapped = true
        }
    }
    
    func newGame() {
        flipCount = 0
        scoreCount = 0
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        cards.shuffle()
        
    }
}
