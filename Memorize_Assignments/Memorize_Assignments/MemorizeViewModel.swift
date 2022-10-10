//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Oriol Sanchez Miro on 6/10/22.
//

import Foundation
class MemorizeViewModel: ObservableObject {
    
    @Published private var model: MemorizeModel = MemorizeModel.init()
    
    //  To acces inside the struct MemorizeModel need to put it MemorizeModel.Card
    var cards: Array<MemorizeModel.Card>{
        return model.cards
    }
    
    var title: String {
        return model.getCurrentTitle()
    }
    
    // MARK: - HELPERS
    func choosedCard(_ card:MemorizeModel.Card) -> Void {
        print ("Tap card in view model")
        model.choose(card)
    }
    
    func newGame ()
    {
        model.newGame()
    }
    
    func getScore () -> Int
    {
        return model.getScore()
    }
}
    
