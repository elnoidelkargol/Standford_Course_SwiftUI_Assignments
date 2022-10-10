//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Oriol Sanchez Miro on 5/10/22.
//

import Foundation
import SwiftUI
struct MemorizeModel{
    
    let themes = [
        Theme(name: "vehicles",
              images: ["🚃","🚞","🚂","🚋","🚝","🚄","🚅","🚆","🚇","🚈","🚉","🚊","🚌","🚍","🚎","🚐","🚑","🚒","🚓","🚔","🚕","🚖","🚗","🚘","🚙","🚚","🚛","🚜"],
              numPair: 6,
              cardColor: .green),
        Theme(name: "emojis",
              images: ["😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷"],
              numPair: 6,
              cardColor: .red),
        Theme(name: "flags",
              images: ["🇦🇺","🇦🇹","🇧🇪","🇧🇷","🇨🇦","🇨🇱","🇨🇳","🇨🇴","🇩🇰","🇫🇮","🇫🇷","🇩🇪","🇭🇰","🇮🇳","🇮🇩","🇮🇪","🇮🇱","🇮🇹","🇯🇵","🇰🇷","🇲🇴","🇲🇾","🇲🇽","🇳🇱","🇳🇿","🇳🇴","🇵🇭","🇵🇱","🇵🇹","🇵🇷","🇷🇺","🇸🇦","🇸🇬","🇿🇦"],
              numPair: 6,
              cardColor: .blue)
    ]

    
    private(set) var cards: Array<Card>
    private var indexOfFaceUpCard : Int?
    private var currentTitle : String
    private var score : Int
    
    init() {
        cards = Array<Card>()
        currentTitle = ""
        score = 0
        newGame()
    }
    
    struct Theme {
        var name:String
        var images:[String]
        var numPair: Int
        var cardColor: Color
        
        init(name: String, images: [String], numPair: Int, cardColor: Color) {
            self.name = name
            self.images = images
            self.numPair = numPair
            self.cardColor = cardColor
        }
    }
    
    struct Card: Identifiable {
        //  Needed to identify the card
        var id: Int
        var isFaceUp : Bool
        var isMatched: Bool
        var content : String
        var color : Color
    }
    
    mutating func newGame ()
    {
        
        let randomInt = Int.random(in: 0..<themes.count)
        let currentTheme = themes[randomInt]
        let images = currentTheme.images.shuffled()
        
        print (images)
        
        score = 0
        currentTitle = currentTheme.name
        cards = Array<Card>()
        
        let pairs = currentTheme.numPair <= images.count ? currentTheme.numPair : images.count
        
        for pairIndex in 0..<pairs
        {
            let image = images[pairIndex]
            cards.append(Card(id: pairIndex*2, isFaceUp: false, isMatched: false, content: image, color: currentTheme.cardColor))
            cards.append(Card(id: pairIndex*2+1, isFaceUp: false, isMatched: false, content: image, color: currentTheme.cardColor))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(_ card:Card) {

        if let choosenCardIndex = cards.firstIndex(where: { $0.id == card.id }),!cards[choosenCardIndex].isFaceUp,!cards[choosenCardIndex].isMatched
        {
            if let firstCardIndex = indexOfFaceUpCard
            {
                if(cards[choosenCardIndex].content == cards[firstCardIndex].content)
                {
                    cards[choosenCardIndex].isMatched = true
                    cards[firstCardIndex].isMatched = true
                    
                    score += 2
                    
                }
                else
                {
                    score = score-2
                }
                indexOfFaceUpCard = nil
            }
            else
            {
                for index in cards.indices
                {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = choosenCardIndex
            }
            cards[choosenCardIndex].isFaceUp.toggle()
        }
        print (score)
    }
    
    // MARK: GETTERS
    
    func getCurrentTitle() -> String {
        return currentTitle
    }
    
    func getScore () -> Int
    {
        return score
    }
}
