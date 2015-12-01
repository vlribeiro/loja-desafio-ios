//
//  Transaction.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class Transaction : Object {
    dynamic var id : Int
    let creditCard : CreditCard
    dynamic var value : Float
    let transactionProducts : List<TransactionProduct>
    
    init(id : Int, creditCard : CreditCard, creditCardId : Int, value : Float, transactionProducts : List<TransactionProduct>) {
        self.id = id
        self.creditCard = creditCard
        self.value = value
        self.transactionProducts = transactionProducts
        
        super.init()
    }

    required init() {
        self.id = 0
        self.creditCard = CreditCard()
        self.value = 0
        self.transactionProducts = List<TransactionProduct>()
        
        super.init()
    }
    
    func getDictionaryData() -> Dictionary<String,Any> {
        var transactionData = Dictionary<String,Any>()
        
        transactionData["CreditCardId"] = self.creditCard.id
        transactionData["Value"] = self.value
        transactionData["CreditCard"] = self.creditCard.getDictionaryData()
        var transctionProductsArray = Array<Dictionary<String,Any>>()
        
        for transactionProduct in self.transactionProducts {
            transctionProductsArray.append(transactionProduct.getDictionaryData())
        }
        
        transactionData["TransactionProducts"] = transctionProductsArray
        
        return transactionData
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}