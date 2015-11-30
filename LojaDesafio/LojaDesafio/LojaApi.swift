//
//  LojaApi.swift
//  LojaDesafio
//
//  Created by Vinicius Ribeiro on 29/11/15.
//  Copyright © 2015 Vinicius Ribeiro. All rights reserved.
//

import Foundation

class LojaApi : NSObject {
    static let serverUrl = "http://"
    
    var data = NSMutableData()
    
    func startConnectionForPath(resourcePath: String) {
        let urlPath = "\(LojaApi.serverUrl)\(resourcePath)"
        let url : NSURL! = NSURL(string: urlPath)
        
        let request = NSURLRequest(URL: url)
        
        let connection: NSURLConnection! = NSURLConnection(request: request,
            delegate: self,
            startImmediately: false)
        
        print("HTTP GET de Api na URL: \(url)")
        
        connection.start()
    }
    
    func postDataForPath(resourcePath: String, data: Dictionary<String,Any>) {
        let urlPath = "\(LojaApi.serverUrl)\(resourcePath)"
        let url : NSURL! = NSURL(string: urlPath)
        
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "POST"
        
        var stringPostData = ""
        
        for (field,fieldData) in data {
            stringPostData += "\(field)=\(fieldData)&"
        }
        
        if !stringPostData.isEmpty {
            stringPostData = (stringPostData as NSString).substringToIndex(stringPostData.characters.count - 1)
            
            let postData = stringPostData.dataUsingEncoding(NSUTF8StringEncoding)
            
            request.HTTPBody = postData
            
            let connection: NSURLConnection! = NSURLConnection(request: request,
                delegate: self,
                startImmediately: false)
            
            print("Posting to \(url)")
            
            connection.start()
        }
        else {
            print("Nothing to POST to \(url)")
        }
    }
    
    func getDictionaryFromData() -> NSDictionary {
        return (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
    }
    
    //NSURLConnection Connection failed
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        print("Failed with error:\(error.localizedDescription)")
    }
    
    //New request so we need to clear the data object
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response:NSURLResponse!) {
        self.data = NSMutableData()
    }
    
    //Append incoming data
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.data.appendData(data)
    }
}