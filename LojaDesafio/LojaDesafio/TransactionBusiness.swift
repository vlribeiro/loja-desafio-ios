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
    
    func fetch() {
        var transaction = TransactionData.fetchActive()
        
        if (transaction == nil) {
            transaction = Transaction()
        }
        
        delegate.didFinishFetch(transaction!)
    }
}

protocol TransactionBusinessProtocol {
    func didFinishFetch(transaction: Transaction)
}