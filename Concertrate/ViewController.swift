//
//  ViewController.swift
//  Concertrate
//
//  Created by Ravi poovaiah on 17/09/19.
//  Copyright © 2019 Ravi poovaiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    //  Properties Observer
    var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
////        flipCountLabel.text = "Flips: \(flipCount)"
//        flipCard(withEmoji: "🎃", on: sender)
//
//    }
    
    
    @IBOutlet var cardButtons: Array<UIButton>!
    
    var emojiChoice: Array<String> = ["🎃", "👻", "🎃", "👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
//        flipCountLabel.text = "Flips: \(flipCount)"

//        flipCard(withEmoji: "👻", on: sender)
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("card Number: \(cardNumber)")
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)

        } else {
            print("Not")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.07843137255, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
}

