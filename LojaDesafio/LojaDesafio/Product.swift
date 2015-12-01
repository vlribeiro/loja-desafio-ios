//
//  Product.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class Product : Object {
    dynamic var id : Int
    dynamic var name : String
    dynamic var productDescription : String
    dynamic var price : Float
    dynamic var imageUrl : String
    
    required init() {
        self.id = 0
        self.name = String()
        self.productDescription = String()
        self.price = 0
        self.imageUrl = String()
        
        super.init()
    }
    
    init(id : Int, name : String, description : String, price : Float, imageUrl : String) {
        self.id = id
        self.name = name
        self.productDescription = description
        self.price = price
        self.imageUrl = imageUrl
        
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}