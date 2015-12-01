//
//  ProductTableViewCell.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var delegate : ProductListTableCellProtocol?
    var product : Product?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productValue: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var viewDetailButton: UIButton!
    
    @IBAction func viewDetail(sender: UIButton) {
        self.delegate?.callForSegue(sender.tag)
    }
    
    @IBAction func addToCart(sender: UIButton) {        
        TransactionProductBusiness.addProduct(self.product!)
    }
    
    func setProduct(product: Product, index: Int, delegate: ProductListTableCellProtocol) {
        self.product = product
        
        self.productName.text = product.name
        self.productValue.text = String(format: "%.2f", product.price)
        self.addToCartButton.tag = index
        self.viewDetailButton.tag = index
        
        self.delegate = delegate
        
        productImage.imageFromUrl(product.imageUrl)
    }
}

protocol ProductListTableCellProtocol {
    func callForSegue(index: Int)
}
