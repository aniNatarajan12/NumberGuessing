//
//  ViewController.swift
//  NumberGuessing
//
//  Created by Anirudh Natarajan on 2/24/20.
//  Copyright © 2020 Anirudh Natarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lowTextField: UITextField!
    @IBOutlet var highTextField: UITextField!
    
    var low = 0
    var high = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func startPressed(_ sender: Any) {
        if lowTextField.text != "" && highTextField.text != "" {
            low = Int(lowTextField.text!)!
            high = Int(highTextField.text!)!
            if high > low {
                self.performSegue(withIdentifier: "startGame", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination: GameController = segue.destination as! GameController {
            destination.low = low
            destination.high = high
        }
    }
    
}

