//
//  TransactionApi.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class TransactionApi : LojaApi {
    var delegate : TransactionApiProtocol?
    let resourcePath = "Transaction"
    
    init(delegate: TransactionApiProtocol) {
        self.delegate = delegate
    }
    
    func saveTransaction(transaction:Transaction) {
        self.postDataForPath(self.resourcePath, data: transaction.getDictionaryData())
    }
    
    func fetchFromJSONDictionary(dictionary: NSDictionary) -> Product {
        return Product(id: dictionary["Id"] as! Int, name: dictionary["Name"] as! String, description: dictionary["Description"] as! String, price: dictionary["Price"] as! Float, imageUrl: dictionary["ÏmageUrl"] as! String)
    }
}

protocol TransactionApiProtocol {
    func didPost(transaction: Transaction)
}