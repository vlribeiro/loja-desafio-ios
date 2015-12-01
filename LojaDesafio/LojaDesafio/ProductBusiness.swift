//
//  ProductBusiness.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class ProductBusiness: ProductApiProtocol {
    var delegate: ProductBusinessProtocol?
    
    init(delegate: ProductBusinessProtocol) {
        self.delegate = delegate
    }
    
    func fetchAll(onlyLocal : Bool) {
        if onlyLocal {
            self.didReceiveResponse(ProductData.fetchAll())
        }
        else {
            let api = ProductApi(delegate: self)
            
            api.getAll()
        }
    }
    
    class func fetchById(productId: Int) -> Product {
        return ProductData.fetchById(productId)
    }
    
    func didReceiveResponse(products: Array<Product>) {
        ProductData.refresh(products)
        
        delegate?.didFinishFetch(products)
    }
}

protocol ProductBusinessProtocol {
    func didFinishFetch(products: Array<Product>)
}