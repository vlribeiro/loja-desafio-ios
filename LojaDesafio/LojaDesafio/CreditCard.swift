//
//  CreditCard.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class CreditCard {
    var id : Int
    var cardholder : String
    var number : String
    var expirationMonth : Int
    var expirationYear : Int
    var cardIssuer : Int
    var csc : String
    
    init() {
        self.id = 0
        self.cardholder = String()
        self.number = String()
        self.expirationMonth = 0
        self.expirationYear = 0
        self.cardIssuer = 0
        self.csc = String()
    }
    
    init(id: Int, cardholder : String, number : String, expirationMonth : Int, expirationYear : Int, cardIssuer : Int, csc : String) {
        self.id = id
        self.cardholder = cardholder
        self.number = number
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.cardIssuer = cardIssuer
        self.csc = csc
    }
    
    func getDictionaryData() -> Dictionary<String,Any> {
        var creditCardData = Dictionary<String,Any>()
        
        creditCardData["Id"] = self.id
        creditCardData["Cardholder"] = self.cardholder
        creditCardData["Number"] = self.number
        creditCardData["ExpirationMonth"] = self.expirationMonth
        creditCardData["ExpirationYear"] = self.expirationYear
        creditCardData["CardIssuer"] = self.cardIssuer
        creditCardData["CSC"] = self.csc
        
        return creditCardData
    }
}