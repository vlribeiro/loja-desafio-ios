//
//  LoadingViewController.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class LoadingViewController : UIViewController, ProductBusinessProtocol {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productBusiness = ProductBusiness(delegate: self)
        
        productBusiness.fetchAll(true)
    }
    
    func didFinishFetch(products: Array<Product>) {
        self.performSegueWithIdentifier("MainTabSegue", sender: self)
    }
}