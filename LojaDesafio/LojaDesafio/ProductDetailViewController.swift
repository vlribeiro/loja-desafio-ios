//
//  ProductDetailViewcontroller.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product : Product
    
    @IBOutlet weak var productTitle: UINavigationItem!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productPrice: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        self.product = Product()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productTitle.title = self.product.name
        self.productImage.imageFromUrl(product.imageUrl)
        self.productDescription.text = product.productDescription
        self.productPrice.text = String(format: "%.2f", product.price)
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addToCart(sender: UIButton) {
        TransactionBusiness.addProduct(self.product)
    }
    
    func setSelectedProduct(product: Product) {
        self.product = product
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
