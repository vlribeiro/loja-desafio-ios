//
//  CartTableViewCell.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class CartTableViewCell : UITableViewCell {
    
    var transactionProduct : TransactionProduct?
    var delegate : CartTableViewCellProtocol?
    
    @IBOutlet weak var cartItemImage: UIImageView!
    @IBOutlet weak var cartItemProductName: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemDeleteButton: UIButton!
    @IBOutlet weak var cartItemQuantity: UILabel!
    
    func setTransactionProduct(transactionProduct: TransactionProduct, index: Int, delegate: CartTableViewCellProtocol) {
        self.transactionProduct = transactionProduct
        self.delegate = delegate
        
        cartItemDeleteButton.tag = index
        
        let product = ProductBusiness.fetchById((self.transactionProduct?.productId)!)
        
        self.cartItemImage.imageFromUrl(product.imageUrl)
        self.cartItemProductName.text = product.name
        self.cartItemPrice.text = String(format: "%.2f", product.price)
        self.cartItemQuantity.text =  "\(transactionProduct.quantity)"
    }
    
    @IBAction func deleteItem(sender: UIButton) {
        TransactionProductBusiness.delete(self.transactionProduct!)
        
        self.delegate?.updateTableView()
    }
}

protocol CartTableViewCellProtocol {
    func updateTableView()
}
