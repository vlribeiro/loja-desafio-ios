//
//  CardViewController.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 01/12/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import UIKit

class CadrViewController : UIViewController, TransactionBusinessProtocol {
    
    var transactionBusiness: TransactionBusiness?
    
    @IBOutlet weak var cardholderText: UITextField!
    @IBOutlet weak var cardNumberText: UITextField!
    @IBOutlet weak var expirationMonthText: UITextField!
    @IBOutlet weak var expirationYearText: UITextField!
    @IBOutlet weak var cscText: UITextField!
    @IBOutlet weak var visaToggle: UISwitch!
    @IBOutlet weak var mastercardToggle: UISwitch!
    @IBAction func visaToggleChanged(sender: UISwitch) {
        self.mastercardToggle.on = false
    }
    @IBAction func mastercardToggleChanged(sender: UISwitch) {
        self.visaToggle.on = false
    }
    @IBAction func cancelled(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func checkout(sender: UIButton) {
        let transaction = TransactionBusiness.fetch()
        
        let cardIssuer = visaToggle.on ? 1 : (mastercardToggle.on ? 2 : 0)
        
        if (validate()) {
            let creditCard = CreditCard(id: 0, cardholder: cardholderText.text!, number: cardNumberText.text!, expirationMonth: Int(expirationMonthText.text!)!, expirationYear: Int(expirationYearText.text!)!, cardIssuer: cardIssuer, csc: cscText.text!)
            
            self.transactionBusiness = TransactionBusiness(delegate: self)
            
            transactionBusiness?.save(transaction, creditCard: creditCard)
        }
    }
    
    func didSaveTransaction(transaction:Transaction) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func validate() -> Bool {
        if cardholderText.text != nil && cardNumberText.text != nil && expirationMonthText.text != nil && Int(expirationMonthText.text!) != nil && expirationYearText.text != nil && Int(expirationYearText.text!) != nil && cscText.text != nil
        {
            return true
        }
        else {
            let alert = UIAlertController(title: "Atenção!", message: "Verifique os dados digitados", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
    }
}
