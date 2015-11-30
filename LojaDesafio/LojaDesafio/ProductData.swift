//
//  ProductData.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class ProductData {
    
    //Mock para dados
    class func fetchAll() -> Array<Product> {
        var result = Array<Product>()
        
        result.append(Product(id: 1, name: "iPhone 6S Plus 16 GB", description: "Novo iPhone 6S Plus 16GB de armazenamento. Cor: Prata.", price: 3999, imageUrl: "http://novo2015.com.br/wp-content/uploads/2015/06/iphone-6-2.jpg"))
        result.append(Product(id: 1, name: "iPhone 6S Plus 64 GB", description: "Novo iPhone 6S Plus 64GB de armazenamento. Cor: Prata.", price: 4299, imageUrl: "http://www.promoinfo.com.br/img/anuncios/107479.jpg"))
        
        return result
    }
}