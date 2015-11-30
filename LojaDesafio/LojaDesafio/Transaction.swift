//
//  Transaction.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import Realm

class Transaction {
    var id : Int
    var creditCardId : Int
    var creditCard : CreditCard
    var value : Float
    var transactionProducts : Array<TransactionProduct>
    
    init() {
        self.id = 0
        self.creditCard = CreditCard()
        self.creditCardId = 0
        self.value = 0
        self.transactionProducts = Array<TransactionProduct>()
    }
    
    init(id : Int, creditCard : CreditCard, creditCardId : Int, value : Float, transactionProducts : Array<TransactionProduct>) {
        self.id = id
        self.creditCard = creditCard
        self.creditCardId = creditCardId
        self.value = value
        self.transactionProducts = transactionProducts
    }
    
    func getDictionaryData() -> Dictionary<String,Any> {
        var transactionData = Dictionary<String,Any>()
        
        transactionData["CreditCardId"] = self.creditCardId
        transactionData["Value"] = self.value
        transactionData["CreditCard"] = self.creditCard.getDictionaryData()
        var transctionProductsArray = Array<Dictionary<String,Any>>()
        
        for transactionProduct in self.transactionProducts {
            transctionProductsArray.append(transactionProduct.getDictionaryData())
        }
        
        transactionData["TransactionProducts"] = transctionProductsArray
        
        return transactionData
    }
}