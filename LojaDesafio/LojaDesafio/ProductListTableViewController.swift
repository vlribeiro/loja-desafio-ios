//
//  ProductListTableViewController.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController, ProductBusinessProtocol {
    var products = Array<Product>()
    
    @IBOutlet var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productBusiness = ProductBusiness(delegate: self)
        
        productBusiness.fetchAll(true)
    }
    
    func didFinishFetch(products: Array<Product>) {
        self.products = products
        
        productTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductTableViewCell", forIndexPath: indexPath) as! ProductTableViewCell
        
        let product = self.products[indexPath.row]
        
        cell.setProduct(product)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ListDetailSegue", sender: indexPath.row)
    }

}
