//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories = [GithubRepository]()
    
    func getRepositoriesWithCompletion(completion:() ->()){
        
        GithubAPIClient.getRepositoriesWithCompletion { (arrayOfAPIDictionaries) in
            
            self.repositories.removeAll() //to get it(storage) ready to add repos coming from API call
            
            for APIDictionary in arrayOfAPIDictionaries {
               let newRepo = GithubRepository.init(dictionary: APIDictionary)
                self.repositories.append(newRepo)
             
//                print("any new repos added? \(newRepo)")
//                print("any new repos added to array??? \(self.reposArray)")
            }
            
               completion()//signals i am done, must let it know
        }
        
        
        
        
    }
    
}
