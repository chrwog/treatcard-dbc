//
//  CardDataSource.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/4/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

class CardDataSource {
    
    init() {
        populateData()
    }
    
    var cards:[Card] = []
    var types:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return cardsInType(index).count
    }
    
    func numberOfGroups() -> Int {
        return types.count
    }
    
    func gettGroupLabelAtIndex(index: Int) -> String {
        return types[index]
    }
    
    // MARK:- Populate Data from plist
    
    func populateData() {
        if let path = NSBundle.mainBundle().pathForResource("templates", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let templateID = dict["templateID"] as! String
                        let type = dict["type"] as! String
                        
                        let card = Card(templateID: templateID, type: type)
                        if !types.contains(type){
                            types.append(type)
                        }
                        cards.append(card)
                    }
                }
            }
        }
    }
    
    // MARK:- FruitsForEachGroup
    
    func cardsInType(index: Int) -> [Card] {
        let item = types[index]
        let filteredCards = cards.filter { (card: Card) -> Bool in
            return card.type == item
        }
        return filteredCards
    }
    
    // MARK:- Add Dummy Data
    
    func addAndGetIndexForNewItem() -> Int {
        
        let card = Card(templateID: "99", type: "Blame")
        
        let count = cardsInType(0).count
        
        let index = count > 0 ? count - 1 : count
        cards.insert(card, atIndex: index)
        
        return index
    }
    
    // MARK:- Delete Items
    
    func deleteItems(items: [Card]) {
        
        for item in items {
            // remove item
            let index = cards.indexOfObject(item)
            if index != -1 {
                cards.removeAtIndex(index)
            }
        }
    }
}

//extension Array {
//    func indexOfObject<T:AnyObject>(item:T) -> Int {
//        var index = -1
//        for element in self {
//            index += 1
//            if item === element as? T {
//                return index
//            }
//        }
//        return index
//    }
//}
