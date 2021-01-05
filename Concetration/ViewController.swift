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

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet var touchButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {

        if let index = touchButtons.firstIndex(of: sender) {
            game.chooseCard(at: index)
            updateViewFromModel()
        }
    }
    @IBAction func newGameTapped(_ sender: Any) {
        game.newGame()
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
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
    
    func flipEmoji(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            
        } else {
            
        }
    }
    
    var emojiChoices = ["👻","⚽️","🚕","🎃","🎲","😡"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }

    
}
