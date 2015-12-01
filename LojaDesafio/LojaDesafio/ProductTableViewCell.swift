//
//  ProductTableViewCell.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productValue: UILabel!
    
    @IBAction func viewDetail(sender: UIButton) {
        
    }
    
    @IBAction func addToCart(sender: UIButton) {
        
    }
    
    func setProduct(product: Product) {
        self.productName.text = product.name
        self.productValue.text = String(format: "%.2f", product.price)
        
        productImage.imageFromUrl(product.imageUrl)
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
