//
//  CardDataSource.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/4/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

class CategoryDataSource {
    
    init() {
        populateData()
    }
    
    var categories:[Category] = []
    var types:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return categoriesInType(index).count
    }
    
    func numberOfGroups() -> Int {
        return types.count
    }
    
    func gettGroupLabelAtIndex(index: Int) -> String {
        return types[index]
    }
    
    // MARK:- Populate Data from plist
    
    func populateData() {
        if let path = NSBundle.mainBundle().pathForResource("categories", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let templateID = dict["categoryID"] as! String
                        let type = dict["type"] as! String
                        
                        let category = Category(templateID: templateID, type: type)
                        if !types.contains(type){
                            types.append(type)
                        }
                        categories.append(category)
                    }
                }
            }
        }
    }
    
    // MARK:- FruitsForEachGroup
    
    func categoriesInType(index: Int) -> [Category] {
        let item = types[index]
        let filteredCategories = categories.filter { (category: Category) -> Bool in
            return category.type == item
        }
        return filteredCategories
    }
    
    // MARK:- Add Dummy Data
    
    func addAndGetIndexForNewItem() -> Int {
        
        let category = Category(templateID: "99", type: "Blame")
        
        let count = categoriesInType(0).count
        
        let index = count > 0 ? count - 1 : count
        categories.insert(category, atIndex: index)
        
        return index
    }
    
    // MARK:- Delete Items
    
    func deleteItems(items: [Category]) {
        
        for item in items {
            // remove item
            let index = categories.indexOfObject(item)
            if index != -1 {
                categories.removeAtIndex(index)
            }
        }
    }
}

extension Array {
    func indexOfObject<T:AnyObject>(item:T) -> Int {
        var index = -1
        for element in self {
            index += 1
            if item === element as? T {
                return index
            }
        }
        return index
    }
}
