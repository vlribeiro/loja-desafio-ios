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
    
    class func transactionProductForProduct(product: Product) -> TransactionProduct? {
        let realm = try! Realm()
        
        NSLog("Consulta por \(product) na transação")
        
        return realm.objects(TransactionProduct).filter("productId = \(product.id)").first
    }
}
