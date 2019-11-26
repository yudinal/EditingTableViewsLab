//
//  Groceries.swift
//  EditingTableViewsLab
//
//  Created by Lilia Yudina on 11/21/19.
//  Copyright © 2019 Lilia Yudina. All rights reserved.
//

import Foundation

struct GroceryItem {
    var name: String
    init(name: String){
        self.name = name
    }
    
    static var groceryList = [
        GroceryItem(name: "Eggs"),
        GroceryItem(name: "Bread"),
        GroceryItem(name: "Milk"),
        GroceryItem(name: "Rice"),
        GroceryItem(name: "Water"),
        GroceryItem(name: "Tomatoes"),
        GroceryItem(name: "Potatoes"),
]
}

