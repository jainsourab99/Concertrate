//
//  ViewController.swift
//  Concertrate
//
//  Created by Ravi poovaiah on 17/09/19.
//  Copyright © 2019 Ravi poovaiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concertration = Concertration(numberOfPairsOfCaards: numberOfPairsOfCaards)
    
    var numberOfPairsOfCaards: Int{
        get{
            return (cardButtons.count + 1) / 2
        }
    }
    
    @IBOutlet weak private var flipCountLabel: UILabel!
    
    
    //  Properties Observer
    private(set) var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.loopinSwift()
    }
    

//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
////        flipCountLabel.text = "Flips: \(flipCount)"
//        flipCard(withEmoji: "🎃", on: sender)
//
//    }
    
    
    @IBOutlet private var cardButtons: Array<UIButton>!
    
    
    @IBAction  private func touchCard(_ sender: UIButton) {
        flipCount += 1
//        flipCountLabel.text = "Flips: \(flipCount)"

//        flipCard(withEmoji: "👻", on: sender)
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("card Number: \(cardNumber)")
//            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()

        } else {
            print("Not")
        }
    }
    
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: .normal)
            } else {
                button.setTitle(" ", for: UIControl.State.normal)
                button.backgroundColor =  card.isMatched ? #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
        }
    }
    
   private var emoji = Dictionary<Int, String>()
   private var emojiChoice: Array<String> = ["🎃", "👻", "🎃", "👻"]

   private func emoji(for card: Card) -> String{
        
        if emoji[card.identifier] == nil{
            if emojiChoice.count > 0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
                emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
            }
        }
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }else{
//            return "?"
//        }
        
        return emoji[card.identifier] ?? "?"
        
    }
    
    var hello: String? = .some("Hello")
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if let data = hello{
            print(data)
        } else {
            
        }
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.07843137255, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
//    func loopinSwift(){
//        for i in stride(from: 0.5, through: 15.25, by: 0.3){
//            print(i)
//        }
//    }
    
}

extension Int{
    var arc4random: Int{
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}



