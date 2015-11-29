//
//  Product.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class Product {
    var id : Int
    var name : String
    var description : String
    var price : Float
    var imageUrl : String
    
    init() {
        self.id = 0
        self.name = String()
        self.description = String()
        self.price = 0
        self.imageUrl = String()
    }
    
    init(id : Int, name : String, description : String, price : Float, imageUrl : String) {
        self.id = id
        self.description = description
        self.price = price
        self.imageUrl = imageUrl
    }
}