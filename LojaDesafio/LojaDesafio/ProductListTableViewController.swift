//
//  ProductListTableViewController.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 30/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController, ProductBusinessProtocol, ProductListTableCellProtocol {
    var products = Array<Product>()
    
    @IBOutlet var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productBusiness = ProductBusiness(delegate: self)
        
        productBusiness.fetchAll(false)
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
        
        cell.setProduct(product, index: indexPath.row, delegate: self)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ProductDetailSegue", sender: indexPath.row)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ProductDetailSegue" {
            let product = self.products[(sender as! Int)]
            
            (segue.destinationViewController as! ProductDetailViewController).setSelectedProduct(product)
        }
    }
    
    func callForSegue(index: Int) {
        self.performSegueWithIdentifier("ProductDetailSegue", sender: index)
    }

}
