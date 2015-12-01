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
        //self.startConnectionForPath(self.resourcePath)
        
        var products = Array<Product>()
        
        products.append(Product(id: 1, name: "iPhone 6S Plus 16 GB", description: "Novo iPhone 6S Plus 16GB de armazenamento. Cor: Prata.", price: 3999, imageUrl: "http://novo2015.com.br/wp-content/uploads/2015/06/iphone-6-2.jpg"))
        products.append(Product(id: 2, name: "iPhone 6S Plus 64 GB", description: "Novo iPhone 6S Plus 64GB de armazenamento. Cor: Prata.", price: 4299, imageUrl: "http://www.promoinfo.com.br/img/anuncios/107479.jpg"))
        products.append(Product(id: 3, name: "iPhone 6S Plus 128 GB", description: "Novo iPhone 6S Plus 128GB de armazenamento. Cor: Prata.", price: 4699, imageUrl: "http://iacom.s8.com.br/produtos/01/00/item/120998/6/120998637G1.jpg"))
        products.append(Product(id: 4, name: "Lumia 950", description: "Lumia 950 rodando Windows Phone", price: 2899, imageUrl: "http://s2.glbimg.com/vBWIFeph0puoygVRPNogxqYYgrk=/0x0:750x375/695x348/s.glbimg.com/po/tt2/f/original/2015/10/13/lumia-950-2.jpg"))
        products.append(Product(id: 5, name: "Lumia 950 XL", description: "Lumia 950 XL rodando Windows Phone", price: 3299, imageUrl: "https://www.thurrott.com/wp-content/uploads/2015/10/Lumia950.jpg"))
        
        self.delegate?.didReceiveResponse(products)
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
    func didReceiveResponse(products: Array<Product>)
}