//
//  CartTableView.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController, CartTableViewCellProtocol {
    var transaction : Transaction
    
    @IBOutlet var cartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.transaction = Transaction()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.transaction = TransactionBusiness.fetch()
        
        self.cartTableView.reloadData()
    }
    
    func updateTableView() {
        self.cartTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transaction.transactionProducts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartTableViewCell", forIndexPath: indexPath) as! CartTableViewCell
        
        let transactionProduct = self.transaction.transactionProducts[indexPath.row]
        
        cell.setTransactionProduct(transactionProduct, index: indexPath.row, delegate: self)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ProductDetailSegue", sender: indexPath.row)
    }
}
