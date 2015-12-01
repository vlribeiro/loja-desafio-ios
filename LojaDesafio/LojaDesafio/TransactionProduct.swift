//
//  TransactionProduct.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class TransactionProduct : Object {
    dynamic var id : Int
    dynamic var transactionId : Int
    dynamic var productId : Int
    dynamic var quantity : Int
    
    init(id : Int, transactionId : Int, productId : Int, quantity : Int) {
        self.id = id
        self.transactionId = transactionId
        self.productId = productId
        self.quantity = quantity
        
        super.init()
    }

    required init() {
        self.id = 0
        self.transactionId = 0
        self.productId = 0
        self.quantity = 0
        
        super.init()
    }
    
    func getDictionaryData() -> Dictionary<String,Any> {
        var creditCardData = Dictionary<String,Any>()
        
        creditCardData["Id"] = self.id
        creditCardData["TransactionId"] = self.transactionId
        creditCardData["ProductId"] = self.productId
        creditCardData["Quantity"] = self.quantity
        
        return creditCardData
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}