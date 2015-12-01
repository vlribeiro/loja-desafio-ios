//
//  Product.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

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
    
    override init(realm: RLMRealm, schema: RLMObjectSchema) {
        self.id = 0
        self.name = String()
        self.productDescription = String()
        self.price = 0
        self.imageUrl = String()
        
        super.init(realm: realm, schema: schema)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override var description : String {
        return "Produto -> { id: \(self.id), nome: \(self.name) }"
    }
}