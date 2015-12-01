//
//  TransactionApi.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

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
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        let jsonResult = self.getDictionaryFromData()
        
        var fetchedTransaction = Array<Transaction>()
        
        if (jsonResult.count > 0) {
            let transactionData: AnyObject = jsonResult.valueForKey("data")!
            
            for i in 0..<transactionData.count {
                let transaction = self.fetchTransactionFromJSONDictionary(transactionData[i]! as! NSDictionary)
                
                fetchedTransaction.append(transaction)
            }
        }
        
        delegate?.didPost(fetchedTransaction.first!)
    }
    
    func fetchTransactionFromJSONDictionary(dictionary: NSDictionary) -> Transaction {
        return Transaction(id: dictionary["id"] as! Int!, creditCard: CreditCard(), value: dictionary["value"] as! Float!, transactionProducts: List<TransactionProduct>())
    }
}

protocol TransactionApiProtocol {
    func didPost(transaction: Transaction)
}