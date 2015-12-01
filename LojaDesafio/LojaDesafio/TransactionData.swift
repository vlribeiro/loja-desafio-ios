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
    
    class func insertOrUpdate(transaction: Transaction) {
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(transaction, update: true)
        })
    }
    
    class func fetchActive() -> Transaction? {
        let realm = try! Realm()
        
        return realm.objects(Transaction).first
    }
}