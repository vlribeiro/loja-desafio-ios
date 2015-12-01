//
//  File.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class TransactionData {
    
    class func insertOrUpdate(transaction: Transaction) -> Transaction {
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(transaction, update: true)
        })
        
        return transaction
    }
    
    class func fetchActive() -> Transaction {
        let realm = try! Realm()
        
        if let transaction = realm.objects(Transaction).first {
            return transaction
        }
        else {
            let transaction = Transaction()
            transaction.id = 1
            
            try! realm.write({
                realm.add(transaction, update: true)
            })
            
            return transaction
        }
    }
    
    class func addTransactionProduct(transactionProduct: TransactionProduct, toTransaction transaction: Transaction) {
        let realm = try! Realm()
        
        try! realm.write({
            transaction.transactionProducts.append(transactionProduct)
            
            realm.add(transaction, update: true)
        })
        
        NSLog("Adicionando \(transactionProduct) na transação")
    }
}