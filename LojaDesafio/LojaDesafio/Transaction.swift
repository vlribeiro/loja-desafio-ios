//
//  Transaction.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

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
}