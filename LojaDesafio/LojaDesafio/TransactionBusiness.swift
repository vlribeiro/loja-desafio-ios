//
//  TransactionBusiness.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class TransactionBusiness {
    var delegate : TransactionBusinessProtocol
    
    init(delegate: TransactionBusinessProtocol) {
        self.delegate = delegate
    }
    
    class func fetch() -> Transaction {
        return TransactionData.fetchActive()
    }
}

protocol TransactionBusinessProtocol {
    //will be used for post
}