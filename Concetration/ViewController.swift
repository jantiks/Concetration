//
//  ViewController.swift
//  Concetration
//
//  Created by Tigran on 1/4/21.
//  Copyright © 2021 Tigran. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    lazy var game = Concentration(numberOfPairsOfCards: (touchButtons.count + 1) / 2)

    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreCountLabel: UILabel!
    @IBOutlet private var touchButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {

        if let index = touchButtons.firstIndex(of: sender) {
            game.chooseCard(at: index)
            updateViewFromModel()
        }
    }
    @IBAction private func newGameTapped(_ sender: Any) {
        print(emojiChoices)
        game.newGame()
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.scoreCount)"
        for index in touchButtons.indices {
            let button = touchButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    

    private var emojiChoices = ["👻","⚽️","🚕","🎃","🎲","😡"]
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }

    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
        
    }
}
