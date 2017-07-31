//
//  StoriesTableViewController.swift
//  UITableViewDemo
//
//  Created by Jeremy Seibert on 7/29/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import UIKit
import Firebase

class StoriesTableViewController: UITableViewController
{
    // MARK: - Properties
    var stories = [Story]()
    private let storiesRef = FIRDatabase.database().reference().child("stories")
    
    @IBOutlet weak var composeBarButtonItem: UIBarButtonItem!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: download our new stories here
        // (1) download data from the reference every time it gets called
        // (2) automatically download data from the reference every time
        
        storiesRef.observe(.value, with: { snapshot in
            self.stories.removeAll()
            
            for child in snapshot.children {
                let story = Story(snapshot: child as! FIRDataSnapshot)
                self.stories.append(story)
            }
            
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        title = "Stories"
        self.navigationItem.rightBarButtonItem = composeBarButtonItem
        
        self.tableView.estimatedRowHeight = 92.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // TODO: return the stories count
        return stories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Story Cell", for: indexPath) as! StoryTableViewCell

        // TODO: assign a story for the cell
        cell.story = self.stories[indexPath.row]
        
        return cell
    }
}












