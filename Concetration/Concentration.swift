//
//  Concentration.swift
//  Concetration
//
//  Created by Tigran on 1/5/21.
//  Copyright © 2021 Tigran. All rights reserved.
//

import Foundation
 
struct Concentration
{
    private(set) var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    private(set) var flipCount = 0
    private(set) var scoreCount = 0
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Chose index which contains cards")
        flipCount += 1
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
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
    
    mutating func newGame() {
        flipCount = 0
        scoreCount = 0
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "pairs must be more than 0")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        cards.shuffle()
        
    }
}
