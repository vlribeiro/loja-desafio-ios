//
//  TransactionBusiness.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class TransactionBusiness: TransactionApiProtocol {
    var delegate : TransactionBusinessProtocol
    
    init(delegate: TransactionBusinessProtocol) {
        self.delegate = delegate
    }
    
    class func fetch() -> Transaction {
        return TransactionData.fetchActive()
    }
    
    class func addProduct(product: Product) {
        if let existingTransactionProduct = TransactionProductData.transactionProductForProduct(product) {
            TransactionProductData.increaseQuantity(existingTransactionProduct, by: 1)
        }
        else {
            //TransactionProductData.insertOrUpdate(TransactionProduct(id: 0, transactionId: TransactionBusiness.fetch().id, productId: product.id, quantity: 1))
            let transaction = TransactionBusiness.fetch()
            
            TransactionData.addTransactionProduct(TransactionProduct(id: TransactionProductData.nextId(), transactionId: transaction.id, productId: product.id, quantity: 1), toTransaction: transaction)
        }
    }
    
    class func delete(transaction: Transaction) {
        TransactionData.delete(transaction)
        
        NSLog("Transação concluída.")
    }
    
    func save(transaction: Transaction, creditCard: CreditCard) {
        //var transactionApi = TransactionApi(delegate: self)
        
        //transactionApi.saveTransaction(transaction)
        
        TransactionBusiness.delete(transaction)
        
        self.didPost(transaction)
    }
    
    func didPost(transaction: Transaction) {
        self.delegate.didSaveTransaction(transaction)
    }
}

protocol TransactionBusinessProtocol {
    func didSaveTransaction(transaction:Transaction)
}