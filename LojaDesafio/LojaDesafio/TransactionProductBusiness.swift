//
//  TransactionProductBusiness.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class TransactionProductBusiness {
    class func addProduct(product: Product) {
        if let existingTransactionProduct = TransactionProductData.transactionProductForProduct(product) {
            existingTransactionProduct.quantity++
            
            TransactionProductData.insertOrUpdate(existingTransactionProduct)
        }
        else {
            TransactionProductData.insertOrUpdate(TransactionProduct(id: 0, transactionId: TransactionBusiness.fetch().id, productId: product.id, quantity: 1))
        }
    }
}