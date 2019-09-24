//
//  Concertration.swift
//  Concertrate
//
//  Created by Sourabh Jain on 20/09/19.
//  Copyright © 2019 Ravi poovaiah. All rights reserved.
//

import Foundation

class Concertration {
    
   private(set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        } set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    //  var cards = [Card]()
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concertration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //  check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //  either no card or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCaards: Int){
        assert(numberOfPairsOfCaards > 0, "Concertration.chooseCard(at: \(numberOfPairsOfCaards)): chosen index not in the cards")
        for _ in 0..<numberOfPairsOfCaards{
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
        }
        //  TODO:- Shuffle the cards
    }
}

