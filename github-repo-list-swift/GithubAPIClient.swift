//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
        
    class func getRepositoriesWithCompletion(completion: [[String: AnyObject]] -> ()){
    
       
        let urlString = "\(Secrets.apiURL)repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)"
    //why does it have to be a static let in order for it to recognize these constants from Secrets file? if defined as class Secrets, would have to create an instance of Secrets() in order to access properties.
        
    
        let url = NSURL(string: urlString)
        
        let session = NSURLSession.sharedSession()
        
        guard let unwrappedURL = url else {return}
        let dataTask = session.dataTaskWithURL (unwrappedURL) { (data, error, response) in
//            
//             print("data message from session \(data)")
//            print("error message from session \(error)")
//           print("response message from session \(response)")
            
           
            guard let unwrappedData = data else {return}
            do {
                
                let array = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: NSJSONReadingOptions.AllowFragments) as! [[String: AnyObject]]
                
                completion(array)
            
             } catch {
            
                print("this is the error statement after serialization \(error)")
            
            }
        
        }
    
    
        dataTask.resume()
    
    
    
    }
    
    
    
    
    
}

