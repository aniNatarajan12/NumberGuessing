//
//  GameController.swift
//  NumberGuessing
//
//  Created by Anirudh Natarajan on 2/24/20.
//  Copyright © 2020 Anirudh Natarajan. All rights reserved.
//

import Foundation
import UIKit

class GameController: UIViewController {
    
    @IBOutlet var guessTextField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var gameButton: UIButton!
    
    var low = 0
    var high = 0
    var target = 0
    var hasWon = false
    var moves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target = generateRandomNumber(min: low, max: high)
        messageLabel.text = ""
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func generateRandomNumber(min: Int, max: Int) -> Int {
        return Int.random(in: min ... max)
    }
    
    @IBAction func gameButtonPressed(_ sender: Any) {
        if !hasWon {
            moves += 1
            if guessTextField.text != "" {
                let guess = Int(guessTextField.text!)!
                if guess > target {
                    messageLabel.text = "Too high!"
                } else if guess < target {
                    messageLabel.text = "Too low!"
                } else {
                    messageLabel.text = "Woohoo! You guessed the number in \(moves) moves!"
                    gameButton.setTitle("Back", for: .normal)
                    hasWon = true
                }
            } else {
                messageLabel.text = "Please type a guess."
            }
        } else {
            self.performSegue(withIdentifier: "done", sender: self)
        }
    }
    


}

