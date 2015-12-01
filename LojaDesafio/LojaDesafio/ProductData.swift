//
//  ProductData.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation
import RealmSwift

class ProductData {
    
    //Mock para dados
    class func fetchAll() -> Array<Product> {
        var result = Array<Product>()
        
        
        
        return result
    }
    
    class func refresh(products : Array<Product>) {
        let realm = try! Realm()
        
        try! realm.write({
            for product in products {
                realm.add(product, update: true)
                
                NSLog("Atualizando prduto \(product).")
            }
        })
    }
    
    class func fetchById(productId: Int) -> Product {
        let realm = try! Realm()
        
        if let product = realm.objects(Product).filter("id = \(productId)").first {
            return product
        }
        else {
            return Product()
        }
    }
}