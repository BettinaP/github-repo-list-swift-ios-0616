//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    //
    var fullName = String()
    var htmlURL = NSURL()
    var repositoryID = String()
    
    
    
    init(dictionary: [String: AnyObject]) {
        
        if let unwrappedRepositoryID = dictionary["id"] {
        
            self.repositoryID = String(unwrappedRepositoryID)
        
    }
        self.fullName = dictionary["full_name"] as! String
        
        if let unwrappedHTMLURL = NSURL(string: dictionary["html_url"] as! String) {
            
            self.htmlURL = unwrappedHTMLURL
        
        }
    }
    
    
}
