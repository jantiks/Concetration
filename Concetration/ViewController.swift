//
//  ViewController.swift
//  Concetration
//
//  Created by Tigran on 1/4/21.
//  Copyright © 2021 Tigran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var touchButtons: [UIButton]!
    
    var emojis = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let index = touchButtons.firstIndex(of: sender) {
            flipEmoji(withEmoji: emojis[index], on: sender)
        }
    }
    
    func flipEmoji(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}
