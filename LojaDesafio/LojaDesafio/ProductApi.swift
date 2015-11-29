//
//  ProductApi.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class ProductApi: LojaApi {
    var delegate : ProductApiProtocol?
    let resourcePath = "Product"
    
    init(delegate: ProductApiProtocol) {
        self.delegate = delegate
    }
    
    func getAll() {
        self.startConnectionForPath(self.resourcePath)
    }
    
    //NSURLConnection delegate function
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        let jsonResult = self.getDictionaryFromData()
        
        var fetchedProducts = Array<Product>()
        
        if (jsonResult.count > 0) {
            let productsData: AnyObject = jsonResult.valueForKey("data")!
            
            for i in 0..<productsData.count {
                let product = self.fetchFromJSONDictionary(productsData[i]! as! NSDictionary)
                
                //ProductData.insertOrUpdate(product)
                
                fetchedProducts.append(product)
            }
        }
        
        delegate?.didReceiveResponse(fetchedProducts)
    }
    
    func fetchFromJSONDictionary(dictionary: NSDictionary) -> Product {
        return Product(id: dictionary["Id"] as! Int, name: dictionary["Name"] as! String, description: dictionary["Description"] as! String, price: dictionary["Price"] as! Float, imageUrl: dictionary["ÏmageUrl"] as! String)
    }
}

protocol ProductApiProtocol {
    func didReceiveResponse(sexes: Array<Product>)
}