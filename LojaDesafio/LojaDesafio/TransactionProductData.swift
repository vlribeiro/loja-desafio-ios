//
//  TransactionProductData.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class TransactionProductData {
    class func insertOrUpdate(transactionProduct: TransactionProduct) -> TransactionProduct {
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(transactionProduct, update: true)
        })
        
        NSLog("Adicionando \(transactionProduct) na transação")
        
        return transactionProduct
    }
    
    class func increaseQuantity(transactionProduct: TransactionProduct, by amount: Int) {
        let realm = try! Realm()
        
        try! realm.write({
            transactionProduct.quantity += amount
            
            realm.add(transactionProduct, update: true)
        })
        
        NSLog("Atualizando \(transactionProduct) na transação")
    }
    
    class func transactionProductForProduct(product: Product) -> TransactionProduct? {
        let realm = try! Realm()
        
        NSLog("Consulta por \(product) na transação")
        
        return realm.objects(TransactionProduct).filter("productId = \(product.id)").first
    }
    
    class func nextId() -> Int {
        let realm = try! Realm()
        
        if let lastInserted = realm.objects(TransactionProduct).sorted("id", ascending: false).first {
            return lastInserted.id + 1
        }
        else {
            return 1
        }
    }
}
