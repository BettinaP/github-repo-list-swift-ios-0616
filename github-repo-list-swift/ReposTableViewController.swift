//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
let store = ReposDataStore.sharedInstance
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        
         store.getRepositoriesWithCompletion {
            NSOperationQueue.mainQueue().addOperationWithBlock {(
                self.tableView.reloadData()
                
            )}
        }
        
        
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.store.repositories[indexPath.row].fullName
        
        return cell
    }
    // MARK: - Table view data source
    
    
 

}
