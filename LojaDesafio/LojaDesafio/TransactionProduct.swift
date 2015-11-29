//
//  TransactionProduct.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class TransactionProduct {
    var id : Int
    var transactionId : Int
    var productId : Int
    var quantity : Int
    
    init() {
        self.id = 0
        self.transactionId = 0
        self.productId = 0
        self.quantity = 0
    }
    
    init(id : Int, transactionId : Int, productId : Int, quantity : Int) {
        self.id = id
        self.transactionId = transactionId
        self.productId = productId
        self.quantity = quantity
    }
}